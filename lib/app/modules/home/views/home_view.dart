import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/values/durations.dart';
import 'package:mobile/app/data/enums/property_category.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/add_data/add_data_view.dart';
import 'package:mobile/app/modules/home/widgets/app_bar.dart';
import 'package:mobile/app/modules/home/widgets/bottom_sheet.dart';
import 'package:mobile/app/modules/home/widgets/category_card.dart';
import 'package:mobile/app/modules/home/widgets/drawer.dart';
import 'package:mobile/app/modules/home/widgets/property/property_card.dart';
import 'package:mobile/app/modules/home/widgets/tool_bar.dart';

import 'property_info/property_info.dart';

class HomeView extends GetView<HomeViewController> {
  HomeDataController get dataController => Get.find<HomeDataController>();

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: HomeAppBar()),
      body: SafeArea(
        child: GetBuilder<HomeViewController>(
          id: controller.idHomeBody,
          builder: (c) {
            return AnimatedSwitcher(
                duration: kDurationPageTransition,
                child: _selectHomeBody(context));
          },
        ),
      ),
    );
  }

  Widget _selectHomeBody(BuildContext context) {
    switch (controller.currentRoute) {
      case MainRoute.property:
        return Column(
          children: [
            const ToolBar(),
            Flexible(
              child: GetBuilder<HomeViewController>(
                  id: controller.idPropertyView,
                  builder: (c) {
                    log('message');
                    return AnimatedSwitcher(
                        duration: kDurationMoreInfo,
                        child: dataController.isPropertySelected
                            ? PropertyInfo()
                            : _createPropertiesView(context));
                  }),
            ),
          ],
        );
      case MainRoute.addData:
        return const AddDataView();
    }
  }

  Widget _createPropertiesView(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return HomeBottomSheet(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: AnimatedAlign(
                alignment: Alignment.center,
                duration: kDurationPageTransition,
                heightFactor: dataController.selectedType == null ? 1 : 0,
                child: SizedBox(
                  width:
                      dataController.selectedType != null ? null : size.width,
                  child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: PropertyType.values
                          .map(
                            (e) => CategoryCard(
                                name: e.name,
                                imageRes: e.iconRes,
                                backgroundColor: e.color,
                                iconColor: e.iconColor,
                                onTap: () {
                                  controller.selectCategory();
                                  dataController.selectCategory(e);
                                }),
                          )
                          .toList()),
                ),
              ),
            ),
            if (dataController.selectedType != null)
              ActionChip(
                  label: Text(dataController.selectedType!.name),
                  onPressed: () => {
                        dataController.unSelectCategory(),
                        controller.unSelectCategory()
                      },
                  avatar: Icon(Icons.close)),
            ...dataController.properties
                .map((e) => PropertyCard(
                    property: e,
                    onTap: (() => {
                          dataController.selectProperty(e),
                          controller.selectProperty()
                        })))
                .toList(),
          ],
        ),
      ),
    );
  }
}
// properties.map((e) => PropertyCard(property: e)).toList()