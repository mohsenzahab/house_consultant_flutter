import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/widgets/card_tile.dart';

class AddDataMenu extends StatelessWidget {
  const AddDataMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardTile(
          leading: CircleAvatar(child: FlutterLogo()),
          title: Text('Add Residence / Site\nNormal Apartment\nProfile'),
          onTap: controller.openDataForm,
        ),
        CardTile(
          leading: CircleAvatar(child: FlutterLogo()),
          title: Text('Add Single File'),
          onTap: controller.openDataFormSingleFile,
        ),
        CardTile(
          leading: CircleAvatar(child: FlutterLogo()),
          title: Text('Add Agent/User'),
          onTap: () {},
        ),
      ],
    );
  }
}
