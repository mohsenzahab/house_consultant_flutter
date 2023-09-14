import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:mobile/app/core/error/error_handler.dart';
import 'package:mobile/app/core/error/failures.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/models/general_data_form.dart';
import 'package:mobile/app/data/models/user/user_data.dart';
import 'package:mobile/app/modules/register/data/register_api.dart';

class RegisterRepository {
  RegisterRepository(this.api);

  final RegisterApi api;

  Future<Either<Failure, String>> registerUser(UserData data) async {
    log('registering user.');
    return handleFutureFunctionsExceptions(
        () async => api.requestUserRegistration(data),
        onNoException: () => log(Constants.messageRegisterSuccess));
  }

  Future<List<UserType>> getUserTypes() => api.getUserTypes();
  Future<List<Office>> getOffices() => api.getOffices();
  Future<List<Country>> getCountries() => api.getCountries();
  Future<List<City>> getCities(Country country) => api.getCities(country);
  Future<List<Region>> getRegions(City city) => api.getRegions(city);
  Future<List<Subregion>> getSubregions(Region region) =>
      api.getSubregions(region);
  Future<List<Currency>> getCurrencies() => api.getCurrencies();
}
