import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: FlutterLogo(),
      toolbarHeight: 80,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Not Logged In',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Remainig Time : 30 : 00',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
