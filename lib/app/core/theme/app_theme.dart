import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';
import 'package:mobile/app/core/theme/decorations.dart';

final ThemeData kAppTheme = ThemeData(
    primarySwatch: kColorPrimarySwatch,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadiusDefault),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kRadiusDefault))))),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusSmallItems))),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kRadiusSmallItems),
      // borderSide: BorderSide(color: Colors.grey)
    )));
