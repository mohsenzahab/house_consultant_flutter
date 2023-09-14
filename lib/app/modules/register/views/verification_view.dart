import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/theme/text_style.dart';
import 'package:mobile/app/modules/register/controllers/register_controller.dart';
import 'package:mobile/app/modules/register/views/membership_selection_view.dart';
import 'package:mobile/app/widgets/text_form_field.dart';

class VerificationView extends GetView<RegisterController> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: FlutterLogo()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter the 6 Digit Code',
                  textAlign: TextAlign.start,
                  style: kTextStyleSignInTitle,
                ),
                kSpaceVertical32,
                MTextFormFiled(
                  label: 'Verification Token',
                  keyboardType: TextInputType.number,
                ),
                Align(
                    heightFactor: 3,
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                        widthFactor: 0.4,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => MemberShipSelectionView(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text('Verify')))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
