import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/colors.dart';
import 'package:mobile/app/core/theme/text_style.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/widgets/card_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  HomeViewController get controller => Get.find<HomeViewController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTileTheme(
          style: ListTileStyle.drawer,
          tileColor: kColorPrimarySwatch.shade100,
          child: ListView(children: [
            const FlutterLogo(
              size: 110,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'App Name',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            const Divider(),
            CardTile(
              title: const Text(
                'Home',
              ),
              trailing: const Icon(Icons.home),
              onTap: controller.openPropertyPage,
            ),
            CardTile(
              title: const Text(
                'Login',
              ),
              trailing: const Icon(Icons.supervised_user_circle),
              onTap: controller.toLoginPage,
            ),
            CardTile(
              title: const Text(
                'Register',
              ),
              trailing: const Icon(Icons.app_registration),
              onTap: controller.toRegisterPage,
            ),
            CardTile(
              title: const Text(
                'Add Property',
              ),
              trailing: const Icon(Icons.note_add),
              onTap: controller.openAddDataPage,
            ),
            CardTile(
              title: Text(
                'Contact Us',
              ),
              trailing: Icon(Icons.contact_mail_sharp),
              // onTap: controller.toRegisterPage,
            ),
            CardTile(
              title: Text(
                'About Us',
              ),
              trailing: const Icon(Icons.info),
              // onTap: controller.toRegisterPage,
            ),
            CardTile(
              title: const Text(
                'Profile',
              ),
              trailing: const Icon(Icons.person),
              onTap: controller.toProfilePage,
            ),
          ]),
        ),
      ),
    );
  }
}
