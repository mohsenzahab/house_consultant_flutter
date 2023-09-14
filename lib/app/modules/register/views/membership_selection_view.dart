import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/modules/register/views/payment_view.dart';
import 'package:mobile/app/widgets/card_tile.dart';

class MemberShipSelectionView extends StatefulWidget {
  const MemberShipSelectionView({Key? key}) : super(key: key);

  @override
  State<MemberShipSelectionView> createState() =>
      _MemberShipSelectionViewState();
}

class _MemberShipSelectionViewState extends State<MemberShipSelectionView> {
  bool privacyPolicy = false;
  bool legalStatement = false;
  int? selectedAccountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: FlutterLogo()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CardTile(
                  selected: selectedAccountType == 1,
                  onTap: () {
                    setState(() {
                      selectedAccountType = 1;
                    });
                  },
                  title: Text('Gold Account'),
                  // trailing: Icon(Icons.),
                  subtitle: Text(
                      'Access to all registered files\nAccess to search items'),
                ),
                kSpaceVertical16,
                CardTile(
                  selected: selectedAccountType == 2,
                  onTap: () {
                    setState(() {
                      selectedAccountType = 2;
                    });
                  },
                  title: Text('Diamond Account'),
                  // trailing: Icon(Icons.),
                  subtitle: Text(
                      'Access to all registered files\nAccess to search items'),
                ),
                kSpaceVertical32,
                Row(
                  children: [
                    Checkbox(
                        value: privacyPolicy,
                        onChanged: (value) {
                          setState(() {
                            privacyPolicy = value ?? false;
                          });
                        }),
                    Text('Accept the privacy policy')
                  ],
                ),
                kSpaceVertical32,
                Row(
                  children: [
                    Checkbox(
                        value: legalStatement,
                        onChanged: (value) {
                          setState(() {
                            legalStatement = value ?? false;
                          });
                        }),
                    Text('Accept the legal statement')
                  ],
                ),
                Align(
                    heightFactor: 4,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => PaymentView(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text('Proceed to payment'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
