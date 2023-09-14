// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      idNumber: json['idNumber'] as String?,
      name: json['name'] as String,
      sureName: json['sureName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      userType: UserType.fromJson(json['userType'] as Map<String, dynamic>),
      saleOffice: Office.fromJson(json['saleOffice'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      birthday: BirthdayDate.fromJson(json['birthday'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
      subregion: Subregion.fromJson(json['subregion'] as Map<String, dynamic>),
      inviteCode: json['inviteCode'] as String?,
      discountCode: json['discountCode'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'idNumber': instance.idNumber,
      'name': instance.name,
      'sureName': instance.sureName,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType.toJson(),
      'saleOffice': instance.saleOffice.toJson(),
      'currency': instance.currency.toJson(),
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthday': instance.birthday.toJson(),
      'country': instance.country.toJson(),
      'city': instance.city.toJson(),
      'region': instance.region.toJson(),
      'subregion': instance.subregion.toJson(),
      'inviteCode': instance.inviteCode,
      'discountCode': instance.discountCode,
      'phone': instance.phone,
    };

const _$GenderEnumMap = {
  Gender.female: '0',
  Gender.male: '1',
};
