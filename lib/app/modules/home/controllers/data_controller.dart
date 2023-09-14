import 'package:get/get.dart';
import 'package:mobile/app/data/enums/property_category.dart';
import 'package:mobile/app/data/models/profile.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/data/models/single_file.dart';

class HomeDataController extends GetxController {
  Property? selectedProperty;
  PropertyType? selectedType;

  get isPropertySelected => selectedProperty != null;

  late List<Property> sample;

  late List<Property> properties;

  @override
  void onInit() {
    super.onInit();
    List<ProFile> proFiles = List.generate(
        12,
        (index) => ProFile(
            code: 1123 + index,
            addedDate: DateTime.now().subtract(Duration(days: index * 5)),
            info: 'Information\n'
                'Babacan Yapi solidifies an inn and royal residence idea into'
                'one on a place that is known for 5.000 sqm comprising of'
                '184 extravagant units in a single square. Envision an inn and'
                'its offices, for example, gathering, valet leaving,'
                'housekeeping, lease a vehicle, travel association, attendant,'
                'wellness focus, sauna, spa, Turkish shower, rub focus, salt'
                'rooms (which help to detox and benefit to breathing issue,'
                'asthma, bronchitis, crude throat, diseases) and open air'
                'pools. Then, at that point, devise such lodging as your home'
                'where you can partake in each office an inn that you have'
                'recently envisioned.',
            prices: {
              '1+1': 150000000,
              '1+2': 2000000000,
              '1+4': 7000000000,
              'Villa': 6000000000000,
              'Shop': 9000000000000,
              'Office': 80000000000000000
            },
            canTakeCitizens: index % 3 == 0 ? true : false,
            propertyType: PropertyType.values[index ~/ 4],
            imgRes:
                'https://is1-2.housingcdn.com/4f2250e8/7fe3f307b76520f1a126eba25ea4c70c/v5/fs/axis_pleasant_apartments-manikonda-hyderabad-axis_home_developers.jpg',
            investmentValue: 0.6,
            isCompleted: index % 2 == 0 ? true : false,
            isDocReady: index % 2 == 1 ? true : false,
            name: 'Sky Land' + index.toString(),
            score: 1000));
    List<SingleFile> singleFiles = List.generate(
        21,
        (index) => SingleFile(
            code: 1123 + index,
            addedDate: DateTime.now().subtract(Duration(days: index * 5)),
            canTakeCitizens: index % 3 == 0 ? true : false,
            propertyType: PropertyType.values[index ~/ 3],
            propertyCategory: proFiles[index ~/ 4],
            imgRes:
                'https://is1-2.housingcdn.com/012c1500/0c398e2275c2fdc9b488f60bf990e521/v6/fs/axis_pleasant_apartments-manikonda-hyderabad-axis_home_developers.jpg',
            investmentValue: 0.6,
            isCompleted: index % 2 == 0 ? true : false,
            isDocReady: index % 2 == 1 ? true : false,
            name: 'Villa' + index.toString(),
            score: 1000));
    sample = [...proFiles, ...singleFiles];
    properties = sample.toList();
  }

  void selectCategory(dynamic category) => {
        selectedType = category,
        if (selectedType != null)
          {
            properties = sample
                .where((element) => element.propertyType == selectedType)
                .toList()
          }
      };

  void unSelectCategory() =>
      {selectedType = null, properties = sample.toList()};

  void selectProperty(Property property) {
    selectedProperty = property;
    properties.remove(selectedProperty);
  }

  void unSelectProperty() {
    selectedProperty = null;
    properties = sample.toList();
    filter();
  }

  void reSelectProperty(Property property) {
    selectedProperty = property;
    filter();
    properties.remove(property);
  }

  void filter() {
    if (selectedType != null) {
      properties = sample
          .where((element) => element.propertyType == selectedType)
          .toList();
    }
  }
}
