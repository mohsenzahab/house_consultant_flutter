import 'package:dio/dio.dart';
import 'package:mobile/app/core/error/exceptions.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/providers/api_provider.dart';

class LoginApi {
  Future<String> requestLogin(String email, String password) async {
    final data = FormData.fromMap({
      keyEmail: email,
      keyPassword: password,
    });
    try {
      final response = await Api.dio.post('user/login', data: data);
      if (response.statusCode == 200) {
        if (response.data[keySuccess] = true) {
          final body = response.data;
          return body[keyToken];
        } else {
          throw ServerException(response.data[keyMessage]);
        }
      } else {
        throw NetworkException(response.statusMessage);
      }
    } on Exception catch (e) {
      throw LocalException(e.toString());
    }
  }
}
