// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get idNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sureName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  Office get saleOffice => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  BirthdayDate get birthday => throw _privateConstructorUsedError;
  Country get country => throw _privateConstructorUsedError;
  City get city => throw _privateConstructorUsedError;
  Region get region => throw _privateConstructorUsedError;
  Subregion get subregion => throw _privateConstructorUsedError;
  String? get inviteCode => throw _privateConstructorUsedError;
  String? get discountCode => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(explicitToJson: true, createToJson: true)
class _$_UserData extends _UserData with DiagnosticableTreeMixin {
  _$_UserData(
      {this.idNumber,
      required this.name,
      required this.sureName,
      required this.email,
      required this.password,
      required this.userType,
      required this.saleOffice,
      required this.currency,
      required this.gender,
      required this.birthday,
      required this.country,
      required this.city,
      required this.region,
      required this.subregion,
      this.inviteCode,
      this.discountCode,
      this.phone})
      : super._();

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final String? idNumber;
  @override
  final String name;
  @override
  final String sureName;
  @override
  final String email;
  @override
  final String password;
  @override
  final UserType userType;
  @override
  final Office saleOffice;
  @override
  final Currency currency;
  @override
  final Gender gender;
  @override
  final BirthdayDate birthday;
  @override
  final Country country;
  @override
  final City city;
  @override
  final Region region;
  @override
  final Subregion subregion;
  @override
  final String? inviteCode;
  @override
  final String? discountCode;
  @override
  final String? phone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(idNumber: $idNumber, name: $name, sureName: $sureName, email: $email, password: $password, userType: $userType, saleOffice: $saleOffice, currency: $currency, gender: $gender, birthday: $birthday, country: $country, city: $city, region: $region, subregion: $subregion, inviteCode: $inviteCode, discountCode: $discountCode, phone: $phone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('idNumber', idNumber))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('sureName', sureName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('userType', userType))
      ..add(DiagnosticsProperty('saleOffice', saleOffice))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('birthday', birthday))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('region', region))
      ..add(DiagnosticsProperty('subregion', subregion))
      ..add(DiagnosticsProperty('inviteCode', inviteCode))
      ..add(DiagnosticsProperty('discountCode', discountCode))
      ..add(DiagnosticsProperty('phone', phone));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(
      this,
    );
  }
}

abstract class _UserData extends UserData {
  factory _UserData(
      {final String? idNumber,
      required final String name,
      required final String sureName,
      required final String email,
      required final String password,
      required final UserType userType,
      required final Office saleOffice,
      required final Currency currency,
      required final Gender gender,
      required final BirthdayDate birthday,
      required final Country country,
      required final City city,
      required final Region region,
      required final Subregion subregion,
      final String? inviteCode,
      final String? discountCode,
      final String? phone}) = _$_UserData;
  _UserData._() : super._();

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  String? get idNumber;
  @override
  String get name;
  @override
  String get sureName;
  @override
  String get email;
  @override
  String get password;
  @override
  UserType get userType;
  @override
  Office get saleOffice;
  @override
  Currency get currency;
  @override
  Gender get gender;
  @override
  BirthdayDate get birthday;
  @override
  Country get country;
  @override
  City get city;
  @override
  Region get region;
  @override
  Subregion get subregion;
  @override
  String? get inviteCode;
  @override
  String? get discountCode;
  @override
  String? get phone;
}
