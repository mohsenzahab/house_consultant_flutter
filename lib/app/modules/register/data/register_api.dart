import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile/app/core/error/exceptions.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/models/general_data_form.dart';
import 'package:mobile/app/data/models/user/user_data.dart';
import 'package:mobile/app/data/providers/api_provider.dart';

class RegisterApi {
  Future<List<T>> _getValues<T extends GeneralData>(
      String path, T Function(Map<String, dynamic>) fromJson) async {
    log('Fetching data from api: $path');
    final response = await Api.dio.get(path);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.toString());
      final bool success = data['success'];
      final String? message = data['message'];
      if (!success) throw ServerException(message);

      final Iterable userTypes = data['data'];
      return userTypes.map<T>((e) => fromJson(e)).toList(growable: false);
    } else {
      throw ServerException();
    }
  }

  Future<List<UserType>> getUserTypes() =>
      _getValues('usertype', UserType.fromJson);
  Future<List<Office>> getOffices() =>
      _getValues('sale-office', Office.fromJson);
  Future<List<Country>> getCountries() =>
      _getValues('country', Country.fromJson);
  Future<List<City>> getCities(Country country) =>
      _getValues('city/${country.id}', City.fromJson);
  Future<List<Region>> getRegions(City city) =>
      _getValues('region/${city.id}', Region.fromJson);
  Future<List<Subregion>> getSubregions(Region region) =>
      _getValues('sub-region/${region.id}', Subregion.fromJson);
  Future<List<Currency>> getCurrencies() =>
      _getValues('currency', Currency.fromJson);

  /// returns a token as string if the registration was successful.
  Future<String> requestUserRegistration(UserData data) async {
    final body = FormData.fromMap(data.toFormDataMap());
    try {
      final response = await Api.dio.post('user/register',
          options: Options(responseType: ResponseType.json), data: body);
      if (response.statusCode == 200) {
        if (response.data[keySuccess] == true) {
          return response.data[keyData]![keyToken];
        } else {
          throw ServerException(response.data[keyMessage]);
        }
      } else {
        throw NetworkException(response.statusMessage);
      }
    } catch (e) {
      throw LocalException(e.toString());
    }
  }
}
