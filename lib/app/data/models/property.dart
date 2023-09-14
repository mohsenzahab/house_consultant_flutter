import 'package:mobile/app/data/enums/property_category.dart';

abstract class Property {
  int code;
  String name;
  int score;
  DateTime addedDate;
  PropertyType propertyType;
  String imgRes;
  double investmentValue;
  bool canTakeCitizens;
  bool isDocReady;
  bool isCompleted;
  Property({
    required this.code,
    required this.name,
    required this.score,
    required this.addedDate,
    required this.imgRes,
    required this.propertyType,
    required this.investmentValue,
    required this.canTakeCitizens,
    required this.isDocReady,
    required this.isCompleted,
  });
}
