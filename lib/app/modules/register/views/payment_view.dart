import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/widgets/text_form_field.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: FlutterLogo()),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Total Amount'),
                kSpaceVertical16,
                Text('150 TL'),
                kSpaceVertical16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ['USD', 'EUR', 'YTL', 'GBP']
                      .map(
                        (e) => ElevatedButton(onPressed: () {}, child: Text(e)),
                      )
                      .toList(),
                ),
                MTextFormFiled(
                  label: 'Card Number',
                  keyboardType: TextInputType.number,
                ),
                kSpaceVertical16,
                MTextFormFiled(
                  label: "Card Holder's Name",
                  keyboardType: TextInputType.name,
                ),
                kSpaceVertical16,
                Row(
                  children: [
                    Expanded(
                      child: MTextFormFiled(
                        label: 'Expire Date',
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    kSpaceHorizontal16,
                    Expanded(
                      child: MTextFormFiled(
                        label: 'CVV',
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Align(
                    heightFactor: 4,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Pay Securely'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
