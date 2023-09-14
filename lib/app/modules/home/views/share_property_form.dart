import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/theme/text_style.dart';
import 'package:mobile/app/data/models/profile.dart';
import 'package:mobile/app/data/models/single_file.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';
import 'package:mobile/app/widgets/dropdown_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SharePropertyForm extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SharePropertyForm({Key? key, required this.infos, required this.languages})
      : super(key: key);

  final Map<String, bool> infos;
  final List<String> languages;

  @override
  State<SharePropertyForm> createState() => _SharePropertyFormState();
}

class _SharePropertyFormState extends State<SharePropertyForm> {
  late Map<String, bool> _infos;
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _infos = widget.infos;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Property Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: kPaddingDefault,
                decoration: BoxDecoration(border: Border.all()),
                child: const Text(
                  'Select the information you want to share',
                  style: kTextStylePageTitle,
                ),
              ),
              SizedBox(
                height: size.height * 3 / 5,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  children: _infos.entries
                      .map((e) => CheckboxListTile(
                          value: e.value,
                          title: Text(e.key),
                          onChanged: (selected) {
                            setState(() {
                              _infos[e.key] = selected ?? false;
                            });
                          }))
                      .toList(),
                ),
              ),
              DropDownPicker<String>(
                hint: 'Languages',
                joinItemsWithHint: true,
                items: widget.languages,
                onItemSelected: (lang) {
                  _selectedLanguage = lang;
                },
              ),
              ElevatedButton(onPressed: share, child: const Text('Share'))
            ],
          ),
        ),
      ),
    );
  }

  void share() async {
    final property = Get.find<HomeDataController>().selectedProperty!;
    final urlImage = property.imgRes;
    final url = Uri.parse(urlImage);
    final response = await http.get(url);
    final bytes = response.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);

    await Share.shareFiles([path],
        text:
            'Property information\n${property.name}\n${property is ProFile ? property.info : ''}\n${property.propertyType.name}${property is SingleFile ? property.propertyCategory.name : ''}\n');
  }
}
