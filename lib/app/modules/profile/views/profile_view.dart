import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/core/values/values.dart';
import 'package:mobile/app/widgets/card_tile.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade400,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardTheme.of(context).copyWith(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blueGrey.shade400,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 52,
                          ),
                        ),
                        Text(
                          'Sanam',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '28 Days Left',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1000 Point',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.webhook_rounded),
                    // color: Colors.grey.shade400,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.monetization_on),
                    // color: Colors.grey.shade400,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.home),
                    // color: Colors.grey.shade400,
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_chart_rounded,
                        size: 60,
                        color: Colors.grey,
                      ),
                      Text('Number of Property Files Added')
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bar_chart,
                        size: 60,
                        color: Colors.grey,
                      ),
                      Text('Number of Property Files Added')
                    ],
                  ),
                ),
              ),
              CardTile(
                leading: Text('Upload Documents'),
                trailing: SizedBox(
                  width: kWidthButtonProfile,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Upload',
                    ),
                  ),
                ),
              ),
              CardTile(
                leading: Text('Invite  Friends'),
                trailing: SizedBox(
                  width: kWidthButtonProfile,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Invite',
                    ),
                  ),
                ),
              ),
              CardTile(
                leading: Text('Add Property'),
                trailing: SizedBox(
                  width: kWidthButtonProfile,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
