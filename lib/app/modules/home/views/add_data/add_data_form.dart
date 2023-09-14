import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/values/values.dart';
import 'package:mobile/app/data/models/agent.dart';
import 'package:mobile/app/modules/home/controllers/home_view_controller.dart';
import 'package:mobile/app/modules/home/views/add_data/agent_selector.dart';
import 'package:mobile/app/widgets/card_section.dart';
import 'package:mobile/app/widgets/dropdown_picker.dart';
import 'package:mobile/app/widgets/grid_card_section.dart';
import 'package:mobile/app/widgets/text_form_field.dart';
import 'package:mobile/app/widgets/group_checkbox.dart';

class AddDataForm extends StatelessWidget {
  const AddDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewController>();
    final isSingleFile = controller.singleDataForm;

    return ListView(
      padding: kPaddingDefault,
      children: [
        MTextFormFiled(
          label: 'Resident/Site/Normal Apartment Name',
          onSaved: (newValue) {},
          validator: (string) {
            return null;
          },
        ),
        DropDownPicker<String>(
          hint: 'Property Category',
          onItemSelected: (item) {},
          items: const ['cat1', 'cat2'],
        ),
        if (isSingleFile)
          DropDownPicker<String>(
            hint: 'Property Category Name',
            onItemSelected: (item) {},
            items: const ['cat1', 'cat2'],
          ),
        if (isSingleFile)
          DropDownPicker<String>(
            hint: 'Property Type',
            onItemSelected: (item) {},
            items: const ['cat1', 'cat2'],
          ),
        if (!isSingleFile)
          GroupCheckBox(
              items: const {'New Home': false, 'Second Hand': false},
              onChanged: ((values) {})),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: DropDownPicker(
                hint: 'Country',
                joinItemsWithHint: true,
                onItemSelected: (selectedItem) {},
                items: const [
                  'Turkey',
                  'Iran',
                ],
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 4,
              child: DropDownPicker(
                hint: 'Region',
                joinItemsWithHint: true,
                onItemSelected: (selectedItem) {},
                items: const ['Turkey', 'Iran'],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: MTextFormFiled(
                label: 'Plot Area',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 4,
              child: MTextFormFiled(
                label: 'Completion Date',
                keyboardType: TextInputType.datetime,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
            ),
          ],
        ),
        kSpaceVertical8,
        Row(
          children: [
            Flexible(
              flex: 4,
              child: MTextFormFiled(
                label: 'Age',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 4,
              child: MTextFormFiled(
                label: 'Registration Date',
                keyboardType: TextInputType.datetime,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
            ),
          ],
        ),
        DropDownPicker<String>(
            hint: 'Construction Company Name',
            items: const [],
            onItemSelected: (item) {}),
        DropDownPicker<String>(
            hint: 'Satis Office Name',
            items: const [],
            onItemSelected: (item) {}),
        if (!isSingleFile) ...[
          MTextFormFiled(
            label: 'Resident/Site/Normal Apartment Description',
            onSaved: (newValue) {},
            validator: (string) {
              return null;
            },
          ),
          kSpaceVertical8,
        ],
        if (!isSingleFile)
          MTextFormFiled(
            label: 'Resident/Site/Normal Apartment Overal Information',
            onSaved: (newValue) {},
            validator: (string) {
              return null;
            },
          ),
        if (isSingleFile) ...[
          Row(
            children: [
              Expanded(
                child: MTextFormFiled(
                  label: 'Price',
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {},
                  validator: (string) {
                    return null;
                  },
                ),
              ),
              kSpaceHorizontal8,
              Expanded(
                child: DropDownPicker(
                    hint: 'Unit',
                    joinItemsWithHint: true,
                    items: const ['USD', 'TL', 'TT'],
                    onItemSelected: (item) {}),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MTextFormFiled(
                  label: 'Instalment Price',
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {},
                  validator: (string) {
                    return null;
                  },
                ),
              ),
              kSpaceHorizontal8,
              Expanded(
                child: DropDownPicker(
                    hint: 'Unit',
                    joinItemsWithHint: true,
                    items: const ['USD', 'TL', 'TT'],
                    onItemSelected: (item) {}),
              )
            ],
          ),
        ],
        if (isSingleFile)
          GridCardSection(
            children: [
              MTextFormFiled(
                label: 'No.Bedroom',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
              MTextFormFiled(
                label: 'No.Bathroom',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
              MTextFormFiled(
                label: 'Net',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
              MTextFormFiled(
                label: 'Brut',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              ),
              MTextFormFiled(
                label: 'Floor',
                keyboardType: TextInputType.number,
                onSaved: (newValue) {},
                validator: (string) {
                  return null;
                },
              )
            ],
          ),
        kSpaceVertical8,
        _createGeneralFeatures(),
        _createSportFacilities(),
        _createSocialFacilities(),
        _createView(),
        _createTransportation(),
        _createConditions(),
        AgentSelector(
          agents: [
            Agent(name: 'Mohammad', languages: ['Ar', 'Tr'], points: 100),
            Agent(name: 'Sahar', languages: ['Ar', 'Tr'], points: 1000),
            Agent(name: 'Babak', languages: ['Ar', 'Tr'], points: 10000),
          ],
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Map Exact Point')),
        ElevatedButton(onPressed: () {}, child: const Text('Map Region Area')),
        ElevatedButton(onPressed: () {}, child: const Text('Upload Photos')),
        ElevatedButton(onPressed: () {}, child: const Text('Upload Videos')),
        ElevatedButton(onPressed: () {}, child: const Text('Upload Documents')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Save'))),
            if (!isSingleFile) ...[
              kSpaceHorizontal16,
              ElevatedButton(
                  onPressed: () {},
                  child:
                      const Text('Save and add Related file to this profile')),
            ]
          ],
        )
      ],
    );
  }

  Widget _createGeneralFeatures() {
    return GridCardSection(title: 'GeneralFeatures', children: [
      DropDownPicker<String>(
          hint: 'Payment Method',
          joinItemsWithHint: true,
          items: const ['Cash', 'Installment'],
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Pre Payment',
          joinItemsWithHint: true,
          items: const ['25%', '50%'],
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Installment Duration',
          joinItemsWithHint: true,
          items: const ['3 M', '6 M'],
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Citizenship Eligiblity',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Clean Documents',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'PR Eligibility',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Completed',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Smart Home',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Investment',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Parking',
          joinItemsWithHint: true,
          items: const ['Indoor', 'Out Door', 'Both'],
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Guest Parking',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Storage',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Kitchen',
          items: const ['Open', 'Close'],
          onItemSelected: (item) {}),
    ]);
  }

  GridCardSection _createSportFacilities() {
    return GridCardSection(title: 'SportFacilities', children: [
      DropDownPicker<String>(
          hint: 'Pool',
          joinItemsWithHint: true,
          items: const ['Inside', 'Outside'],
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Gym',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Football Court',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Tennis Court',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Volleyball Court',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Basketball Court',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Turkish Bath',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'SPA',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Sona',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Jakozi',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Steam Room',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Aqua Park',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Children’s Park',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Meeting Room',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
    ]);
  }

  GridCardSection _createSocialFacilities() {
    return GridCardSection(title: 'SocialFacilities', children: [
      DropDownPicker<String>(
          hint: 'Cinema',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Cafe',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Shopping Mall',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Restaurant',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
    ]);
  }

  GridCardSection _createTransportation() {
    return GridCardSection(title: 'Transportation', children: [
      MTextFormFiled(
        label: 'Mtro Station',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      MTextFormFiled(
        label: 'Bus Station',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      MTextFormFiled(
        label: 'AirPort',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      MTextFormFiled(
        label: 'Marina',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      MTextFormFiled(
        label: 'Hospitals',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      MTextFormFiled(
        label: 'Train',
        keyboardType: TextInputType.datetime,
        suffix: 'Min',
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
    ]);
  }

  GridCardSection _createView() {
    return GridCardSection(title: 'View', children: [
      DropDownPicker<String>(
          hint: 'Sea View',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Nature View',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'City View',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Sea Front',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
      DropDownPicker<String>(
          hint: 'Resident View',
          joinItemsWithHint: true,
          items: kListYesNo,
          onItemSelected: (item) {}),
    ]);
  }

  Widget _createConditions() {
    return CardSection(padding: true, title: "Conditions", children: [
      kSpaceVertical8,
      MTextFormFiled(
        label: 'Google Drive Link',
        keyboardType: TextInputType.emailAddress,
        onSaved: (string) {},
        validator: (string) {
          return null;
        },
      ),
      kSpaceVertical8,
      Row(
        children: [
          Flexible(
            child: MTextFormFiled(
              label: 'KDV',
              onSaved: (string) {},
              validator: (string) {
                return null;
              },
            ),
          ),
          kSpaceHorizontal8,
          Flexible(
            child: MTextFormFiled(
              label: '6%',
              onSaved: (string) {},
              validator: (string) {
                return null;
              },
            ),
          ),
          kSpaceHorizontal8,
          Flexible(
            child: MTextFormFiled(
              label: 'Calculation',
              onSaved: (string) {},
              validator: (string) {
                return null;
              },
            ),
          ),
        ],
      )
    ]);
  }
}
