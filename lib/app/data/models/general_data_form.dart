import 'package:mobile/app/core/values/constants.dart';

abstract class GeneralData {
  GeneralData(
    this.id,
    this.title,
  );

  final int id;
  final String title;

  GeneralData.fromJson(Map<String, dynamic> map)
      : id = map[keyId],
        title = map[keyTitle];

  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};

  @override
  String toString() => title;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeneralData && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

class Country extends GeneralData {
  Country(super.id, super.title);
  Country.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class City extends GeneralData {
  City(super.id, super.title);
  City.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class Region extends GeneralData {
  Region(super.id, super.title);
  Region.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class Subregion extends GeneralData {
  Subregion(super.id, super.title);
  Subregion.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class UserType extends GeneralData {
  UserType(super.id, super.title);
  UserType.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class Office extends GeneralData {
  Office(super.id, super.title);
  Office.fromJson(Map<String, dynamic> map) : super.fromJson(map);
  @override
  Map<String, dynamic> toJson() => {keyId: id, keyTitle: title};
}

class Currency extends GeneralData {
  final String sign;
  Currency(super.id, super.title, this.sign);

  Currency.fromJson(Map<String, dynamic> map)
      : sign = map[keySign],
        super.fromJson(map);

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({keySign: sign});
}
