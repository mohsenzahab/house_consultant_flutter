import 'package:mobile/app/data/models/profile.dart';
import 'package:mobile/app/data/models/property.dart';

class SingleFile extends Property {
  ProFile propertyCategory;

  SingleFile(
      {required this.propertyCategory,
      required super.code,
      required super.name,
      required super.score,
      required super.addedDate,
      required super.propertyType,
      required super.investmentValue,
      required super.canTakeCitizens,
      required super.isDocReady,
      required super.imgRes,
      required super.isCompleted});
}
