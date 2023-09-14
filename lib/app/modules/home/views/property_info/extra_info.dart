import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/modules/home/widgets/property/secondary_attributes.dart';

class ExtraInfo extends StatelessWidget {
  ExtraInfo({Key? key, required this.attributes}) : super(key: key);

  final List<PrimaryAttribute> attributes;
  final List<SecondaryAttribute> generalFeatures = [
    SecondaryAttribute(title: 'Citizenship Eligibility', value: true),
    SecondaryAttribute(title: 'Permanent Resident Eligibility', value: false),
    SecondaryAttribute(title: 'Status', value: 'New Home'),
    SecondaryAttribute(title: 'Payment', value: 'Cash'),
    SecondaryAttribute(title: 'Title Deed Time', value: '1 Month'),
    SecondaryAttribute(title: 'PrePayment', value: '50%'),
    SecondaryAttribute(title: 'Parking', value: 'Indoor/Outdoor'),
    SecondaryAttribute(title: 'Guest Parking', value: true),
    SecondaryAttribute(title: 'Smart Home', value: false),
    SecondaryAttribute(title: 'Kitchen', value: 'close'),
    SecondaryAttribute(title: 'Gas', value: true),
    SecondaryAttribute(title: 'Asansor', value: false),
    SecondaryAttribute(title: 'Central Heating', value: true),
    SecondaryAttribute(title: 'Exper Price', value: '90%'),
    SecondaryAttribute(title: 'Storage', value: false),
  ];
  final List<SecondaryAttribute> sportFacilities = [
    SecondaryAttribute(title: 'Pool', value: 'Inside'),
    SecondaryAttribute(title: 'GYM', value: true),
    SecondaryAttribute(title: 'Football Court', value: true),
    SecondaryAttribute(title: 'Tennis Court', value: true),
    SecondaryAttribute(title: 'Volleyball Court', value: false),
    SecondaryAttribute(title: 'Basketball Court', value: false),
    SecondaryAttribute(title: 'Turkish Bath', value: false),
    SecondaryAttribute(title: 'SPA', value: true),
    SecondaryAttribute(title: 'Sona', value: false),
    SecondaryAttribute(title: 'Jakozi', value: true),
    SecondaryAttribute(title: 'Steam Room', value: true),
    SecondaryAttribute(title: 'Aqua Park', value: false),
    SecondaryAttribute(title: 'Children’s Park', value: false),
    SecondaryAttribute(title: 'Meeting Room', value: true),
  ];
  final List<SecondaryAttribute> socialFacilities = [
    SecondaryAttribute(title: 'Cinema', value: true),
    SecondaryAttribute(title: 'Cafe', value: true),
    SecondaryAttribute(title: 'Shopping Mall', value: true),
    SecondaryAttribute(title: 'Restaurant', value: true),
  ];
  final List<SecondaryAttribute> view = [
    SecondaryAttribute(title: 'Sea View', value: true),
    SecondaryAttribute(title: 'Nature View', value: false),
    SecondaryAttribute(title: 'City View', value: true),
    SecondaryAttribute(title: 'Sea Front', value: true),
    SecondaryAttribute(title: 'Resident View', value: false),
  ];
  final List<SecondaryAttribute> transportation = [
    SecondaryAttribute(title: 'Metro Station', value: '15 Min'),
    SecondaryAttribute(title: 'Bus Station', value: '25 Min'),
    SecondaryAttribute(title: 'AirPort', value: '1:30 Min'),
    SecondaryAttribute(title: 'Marina', value: '20 Min'),
    SecondaryAttribute(title: 'Hospitals', value: '45 Min'),
    SecondaryAttribute(title: 'Train', value: '35 Min'),
  ];
  final List<String> agentLangs = ['En', 'Fa', 'Tur', 'Rus'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Table(
          border: const TableBorder(
            verticalInside: BorderSide(width: 2),
          ),
          children: attributes
              .map((e) => TableRow(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.value),
                        )
                      ]))
              .toList(),
        ),
        kSpaceVertical8,
        SecondaryAttributes(
            title: 'General Features', attributes: generalFeatures),
        kSpaceVertical8,
        SecondaryAttributes(
            title: 'Sport Facilities', attributes: sportFacilities),
        kSpaceVertical8,
        SecondaryAttributes(
            title: 'Social Facilities', attributes: socialFacilities),
        kSpaceVertical8,
        SecondaryAttributes(title: 'View', attributes: view),
        kSpaceVertical8,
        SecondaryAttributes(
            title: 'Transportation', attributes: transportation),
        kSpaceVertical8,
        Container(
          padding: kPaddingDefault,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agent's Language"),
              kSpaceVertical8,
              Wrap(
                children: agentLangs
                    .map((e) => Container(
                          decoration: BoxDecoration(border: Border.all()),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: kPaddingInfoBox,
                          child: Text(e),
                        ))
                    .toList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PrimaryAttribute {
  String title;
  String value;
  PrimaryAttribute({
    required this.title,
    required this.value,
  });
}

class SecondaryAttribute {
  SecondaryAttribute({
    required this.title,
    required this.value,
  });
  String title;
  // String or bool
  dynamic value;

  get isBool => value is bool;
}
