import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';

const double kRadiusCircular = 15;
const double kRadiusSmallItems = 4;
const double kRadiusDefault = 15.0;

const kSpaceVertical8 = SizedBox(
  height: 8.0,
);
const kSpaceVertical16 = SizedBox(
  height: 16.0,
);
const kSpaceVertical32 = SizedBox(
  height: 32.0,
);
const kSpaceHorizontal8 = SizedBox(
  width: 8.0,
);
const kSpaceHorizontal16 = SizedBox(
  width: 16.0,
);

const kPaddingDefault = EdgeInsets.all(8);
const kPaddingInfoBox = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

final BorderRadius kBorderRadiusDefault = BorderRadius.circular(kRadiusDefault);
final BorderRadius kBorderRadiusSmall =
    BorderRadius.circular(kRadiusSmallItems);

const kDecorationBottomSheet = BoxDecoration(
    color: kColorBottomSheet,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadiusCircular),
        topRight: Radius.circular(kRadiusCircular)));

final kDecorationDropDownPicker = InputDecoration(
  hintMaxLines: 2,
  floatingLabelBehavior: FloatingLabelBehavior.always,

  // alignLabelWithHint: true,
  suffixIcon: DecoratedBox(
      decoration: ShapeDecoration(
          color: kColorPrimarySwatch.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadiusSmallItems))),
      child: const Icon(
        Icons.arrow_drop_down,
        size: 40,
      )),
  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
);
