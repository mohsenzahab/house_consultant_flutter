import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/add_data/add_data_form.dart';
import 'package:mobile/app/modules/home/views/add_data/add_data_menu.dart';

class AddDataView extends StatelessWidget {
  const AddDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    return WillPopScope(
      onWillPop: controller.handleAddDataFormBack,
      child: GetBuilder<HomeViewController>(
        id: controller.idAddDataBuilder,
        builder: (c) {
          return _selectView(c);
        },
      ),
    );
  }

  Widget _selectView(HomeViewController c) {
    if (c.addDataMenuOpen) {
      return AddDataMenu();
    } else {
      return AddDataForm();
    }
  }
}
