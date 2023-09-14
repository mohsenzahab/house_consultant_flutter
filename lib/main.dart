import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/core/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "House Consultant",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: kAppTheme,
    );
  }
}
