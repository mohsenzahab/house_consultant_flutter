import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/profile.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/data/models/single_file.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/property_info/property_summary.dart';
import 'package:mobile/app/modules/home/views/property_info/single_file_info.dart';
import 'package:mobile/app/modules/home/widgets/property/property_card.dart';
import 'package:mobile/app/modules/home/widgets/property/text_info.dart';

class MainInfo extends GetView<HomeViewController> {
  MainInfo({
    Key? key,
    required this.property,
  }) : super(key: key);

  final Property property;

  HomeDataController get dataController => Get.find<HomeDataController>();

  @override
  Widget build(BuildContext context) {
    SingleFile? singleFile;
    ProFile proFile;
    if (property is SingleFile) {
      singleFile = property as SingleFile;
      proFile = singleFile.propertyCategory;
    } else {
      proFile = property as ProFile;
    }
    List<Property> properties = dataController.properties.toList();
    if (singleFile != null) {
      properties = properties.whereType<SingleFile>().toList();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: LanguageBar(),
        ),
        if (singleFile != null) SingleFileInfo(file: singleFile),
        if (singleFile != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: kBorderRadiusDefault,
              child: PropertySummary(
                property: singleFile.propertyCategory,
                withIcons: false,
              ),
            ),
          ),
        TextInfo(text: proFile.name),
        TextInfo(
            text: proFile.prices.entries
                .map((e) => '${e.key} ${e.value}')
                .join('\n')),
        TextInfo(text: proFile.info),
        const TextInfo(text: 'Construction Company Name:'),
        const TextInfo(text: 'Satis Office Name:'),
        ...properties.map((p) => PropertyCard(
              property: p,
              onTap: () {
                dataController.reSelectProperty(p);
                controller.reSelectProperty();
              },
            )),
      ],
    );
  }
}

class LanguageBar extends StatelessWidget {
  const LanguageBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('En')),
        ElevatedButton(onPressed: () {}, child: const Text('Tr')),
        ElevatedButton(onPressed: () {}, child: const Text('Fa')),
        ElevatedButton(onPressed: () {}, child: const Text('ar')),
      ],
    );
  }
}
