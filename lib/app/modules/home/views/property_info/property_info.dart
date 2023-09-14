import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/values/durations.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';

import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/phones_view.dart';

import 'package:mobile/app/modules/home/views/property_info/extra_info.dart';
import 'package:mobile/app/modules/home/views/property_info/property_summary.dart';
import 'package:mobile/app/modules/home/widgets/picture_actions.dart';
import 'package:mobile/app/modules/home/widgets/property/action_bar.dart';

import 'main_info.dart';

class PropertyInfo extends GetView<HomeViewController> {
  const PropertyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('property info built');

    final dataController = Get.find<HomeDataController>();
    return WillPopScope(
      onWillPop: Get.find<HomeViewController>().handleBack,
      child: SingleChildScrollView(
        controller: controller.scrollController,
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<HomeViewController>(
                // id: controller.idPropertyView,
                builder: (c) {
                  return ClipRRect(
                    borderRadius: kBorderRadiusDefault,
                    child: AnimatedAlign(
                      alignment: Alignment.center,
                      duration: kDurationMoreInfo,
                      heightFactor:
                          dataController.selectedProperty != null ? 1 : 0,
                      child: dataController.selectedProperty != null
                          ? PropertySummary(
                              property: dataController.selectedProperty!)
                          : null,
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ActionBar(),
            ),
            GetBuilder<HomeViewController>(
                id: controller.idMainInfo,
                builder: (c) {
                  return AnimatedSwitcher(
                      duration: kDurationMoreInfo,
                      child: _selectBody(c, dataController));
                }),
          ],
        ),
      ),
    );
  }

  Widget _selectBody(HomeViewController c, HomeDataController dc) {
    switch (c.currentView) {
      case InfoRoute.main:
        return MainInfo(property: dc.selectedProperty!);
      case InfoRoute.extra:
        return ExtraInfo(
          attributes: [
            PrimaryAttribute(title: 'Plot Area', value: '1900'),
            PrimaryAttribute(title: 'Completed Date', value: '2202/10/11'),
            PrimaryAttribute(title: 'Age', value: '8'),
            PrimaryAttribute(title: 'Registration Date', value: '2202/10/11'),
            PrimaryAttribute(title: 'Plot Area', value: '1900'),
          ],
        );
      case InfoRoute.phone:
        return const PhonesView();
    }
  }
}

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: GetBuilder<HomeViewController>(
          id: Get.find<HomeViewController>().idBackButton,
          builder: (c) {
            return AnimatedSize(
                duration: kDurationMoreInfo,
                child: Text(
                    c.currentView == InfoRoute.main ? 'More Info' : 'Back'));
          },
        ));
  }
}
