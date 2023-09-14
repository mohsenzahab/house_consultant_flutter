import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/enums/gender.dart';
import 'package:mobile/app/data/models/birthday_date.dart';
import 'package:mobile/app/data/models/general_data_form.dart';
import 'package:flutter/foundation.dart';
part 'user_data.freezed.dart';
part 'user_data.g.dart';

@Freezed(fromJson: true, copyWith: false, equal: false, toJson: true)
class UserData with _$UserData {
  const UserData._();
  @JsonSerializable(explicitToJson: true, createToJson: true)
  factory UserData({
    String? idNumber,
    required String name,
    required String sureName,
    required String email,
    required String password,
    required UserType userType,
    required Office saleOffice,
    required Currency currency,
    required Gender gender,
    required BirthdayDate birthday,
    required Country country,
    required City city,
    required Region region,
    required Subregion subregion,
    String? inviteCode,
    String? discountCode,
    String? phone,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> map) =>
      _$UserDataFromJson(map);

  Map<String, dynamic> toFormDataMap() =>
      toJson().map<String, dynamic>((key, value) => MapEntry(
          key, value is Map ? '${value[keyId] ?? value[keyBirthday]}' : value));
}
