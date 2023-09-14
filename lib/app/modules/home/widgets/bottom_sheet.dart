import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/single_file.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeBottomSheet extends GetView<HomeViewController> {
  HomeBottomSheet({Key? key, this.body}) : super(key: key);

  final Widget? body;

  HomeDataController get dataController => Get.find<HomeDataController>();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 40,

      borderRadius: kDecorationBottomSheet.borderRadius,
      maxHeight: MediaQuery.of(context).size.height - kToolbarHeight,
      // collapsed: Container(
      //   decoration: kDecorationBottomSheet,
      //   width: MediaQuery.of(context).size.width,
      //   child: Center(child: Text('Hot files')),
      // ),
      panel: SizedBox(
        // decoration: kDecorationBottomSheet,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 40,
                decoration: kDecorationBottomSheet,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Hot Files')),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,

                  // shrinkWrap: true,
                  children: dataController.properties
                      .whereType<SingleFile>()
                      .map((e) => InkResponse(
                          onTap: () {
                            dataController.selectProperty(e);
                            controller.selectProperty();
                          },
                          child: Card(
                              elevation: 5, child: Image.network(e.imgRes))))
                      .toList()),
            )
          ],
        ),
      ),
      body: body,
    );
  }
}
