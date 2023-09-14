import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/property_info/property_info.dart';
import 'package:mobile/app/modules/home/views/share_property_form.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MoreInfoButton(onPressed: controller.handleBackButton),
        const SizedBox(
          width: 64,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Theme(
              data: ThemeData(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  chipTheme: const ChipThemeData(
                      padding: EdgeInsets.zero,
                      labelPadding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 6))),
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 2,
                runSpacing: 2,
                children: [
                  GetBuilder<HomeViewController>(
                    id: InfoRoute.phone.index,
                    builder: (c) {
                      log('phone icon built');
                      if (c.currentView == InfoRoute.phone) {
                        return const SizedBox();
                      }
                      return ActionChip(
                          onPressed: c.showPhones,
                          label: const Icon(Icons.phone_in_talk));
                    },
                  ),
                  ActionChip(
                      onPressed: () {}, label: const Icon(Icons.g_mobiledata)),
                  ActionChip(
                      onPressed: () {},
                      label: const Icon(Icons.document_scanner)),
                  ActionChip(
                      onPressed: controller.toVideoGallery,
                      label: const Icon(Icons.video_camera_back_outlined)),
                  ActionChip(
                      onPressed: () {}, label: const Icon(Icons.location_on)),
                  ActionChip(
                      onPressed: () {},
                      label: const Icon(Icons.account_balance_wallet_outlined)),
                  ActionChip(
                      onPressed: () {
                        Get.to(() => SharePropertyForm(
                              infos: {
                                'Property ID': false,
                                'Property Name': false,
                                'Property Prices': false,
                                'Property information': false,
                                'More Info': false,
                                'Property Documents': false,
                                'Exterior Pictures': false,
                                'Interior Pictures': false,
                                'Social Pictures': false,
                                'Exterior Videos': false,
                                'Interior Videos': false,
                                'Social Videos': false,
                              },
                              languages: ['Fa', 'En', 'Tr'],
                            ));
                      },
                      label: const Icon(Icons.share)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
