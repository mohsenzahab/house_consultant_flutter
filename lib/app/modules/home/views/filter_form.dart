import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/widgets/dropdown_picker.dart';
import 'package:mobile/app/widgets/price_range_picker.dart';
import 'package:mobile/app/widgets/group_checkbox.dart';

class FilterForm extends StatelessWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    final size = MediaQuery.of(context).size;
    double formHeight = size.height * .8;
    double formWidth = size.width;
    double bottomBarTop = formHeight * 0.92;
    double bottomBarHeight = formHeight - bottomBarTop;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        WillPopScope(
          onWillPop: controller.handleBack,
          child: Container(
            height: formHeight,
            width: formWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: kBorderRadiusDefault),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: bottomBarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropDownPicker<String>(
                      joinItemsWithHint: true,
                      items: ['RENT', 'BUY'],
                      onItemSelected: (item) {}),
                  DropDownPicker<String>(
                      hint: 'Property Category',
                      items: [],
                      onItemSelected: (item) {}),
                  DropDownPicker<String>(
                      hint: 'Property Type',
                      items: [],
                      onItemSelected: (item) {}),
                  GroupCheckBox(items: {
                    'New Home': false,
                    'Second Hand': false,
                    'Hot Files': false,
                    'Only Available Files': false,
                  }, onChanged: (values) {}),
                  PriceRangePicker(
                    title: 'Price (USD/TL)',
                    onRangeChanged: ((min, max) {}),
                  ),
                  PriceRangePicker(
                    title: 'Net',
                    onRangeChanged: ((min, max) {}),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kSpaceVertical8,
                            Text(
                              '   General Features',
                              textAlign: TextAlign.start,
                            ),
                            kSpaceVertical8,
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              shrinkWrap: true,
                              childAspectRatio: 2.5,
                              children: [
                                DropDownPicker<int>(
                                    hint: 'Number of Bedrooms',
                                    items: [1, 2, 3, 4, 5],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Payment Method',
                                    joinItemsWithHint: true,
                                    items: ['Cash', 'Installment'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Citizenship Eligiblity',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Clean Documents',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'PR Eligibility',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Completed',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Floor',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Investment',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Parking',
                                    joinItemsWithHint: true,
                                    items: ['Indoor', 'Out Door', 'Both'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Guest Parking',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Storage',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Smart Home',
                                    joinItemsWithHint: true,
                                    items: ['Yes', 'No'],
                                    onItemSelected: (item) {}),
                                DropDownPicker<String>(
                                    hint: 'Kitchen',
                                    items: ['Open', 'Close'],
                                    onItemSelected: (item) {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -10,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const CircleAvatar(
              backgroundColor: Colors.red,
              maxRadius: 15,
              child: Icon(Icons.close),
            ),
          ),
        ),
        Positioned.fill(
          top: bottomBarTop,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                borderRadius: kBorderRadiusDefault),
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text('Filter'),
                )),
          ),
        ),
      ],
    );
  }
}
