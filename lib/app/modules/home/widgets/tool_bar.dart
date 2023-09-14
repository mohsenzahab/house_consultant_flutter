import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/widgets/search_bar.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'MAP',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: controller.openFilterForm,
            child: const Text(
              'Filter',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Expanded(child: SearchBar()),
      ],
    );
  }
}
