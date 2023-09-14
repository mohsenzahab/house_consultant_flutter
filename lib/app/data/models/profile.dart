import 'package:mobile/app/data/models/property.dart';

class ProFile extends Property {
  Map<String, int> prices;
  String info;

  ProFile(
      {required super.code,
      required super.name,
      required super.score,
      required this.prices,
      required this.info,
      required super.imgRes,
      required super.addedDate,
      required super.propertyType,
      required super.investmentValue,
      required super.canTakeCitizens,
      required super.isDocReady,
      required super.isCompleted});
}
