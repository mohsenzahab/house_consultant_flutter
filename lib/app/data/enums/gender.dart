import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/core/values/constants.dart';

enum Gender {
  @JsonValue('0')
  female,
  @JsonValue('1')
  male;

  Map<String, int> toMap() => {keyGender: index};

  factory Gender.fromMap(Map<String, dynamic> map) =>
      Gender.values[map[keyGender]];

  @override
  String toString() => name;
}
