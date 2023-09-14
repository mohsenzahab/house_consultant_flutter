import 'package:flutter/material.dart';
import 'package:mobile/app/data/models/single_file.dart';
import 'package:mobile/app/modules/home/widgets/property/text_info.dart';
import 'package:mobile/app/widgets/card_row.dart';

class SingleFileInfo extends StatelessWidget {
  const SingleFileInfo({Key? key, required this.file}) : super(key: key);

  final SingleFile file;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInfo(text: file.name),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Country/City/Region/Sub Region'), Text('For Sale')],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Price'), Text('1500000'), Text('USD')],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Instalment Price'), Text('1500000'), Text('USD')],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Property Category'),
            Text(file.propertyCategory.name),
          ],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Property Type'),
            Text(file.propertyType.name),
            Text('USD')
          ],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('No.Bedroom'),
            Text('1'),
            Text('No.Bathroom'),
            Text('1')
          ],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Net'), Text('60'), Text('Brut'), Text('80')],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Floor'),
            Text('10'),
            Text('Plot Area'),
            Text('1000')
          ],
        ),
        CardRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Age'),
            Text('14'),
            Text('Completion Date'),
            Text('2022/4/11')
          ],
        ),
        FittedBox(
          child: CardRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Citizenship Eligibility:Yes'),
              Text('Permanent Resident Eligiblity:No'),
            ],
          ),
        ),
      ],
    );
  }
}
