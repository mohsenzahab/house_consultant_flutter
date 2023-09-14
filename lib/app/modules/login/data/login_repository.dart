import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobile/app/core/error/error_handler.dart';
import 'package:mobile/app/core/error/failures.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/providers/prefs.dart';
import 'package:mobile/app/modules/login/data/login_api.dart';

class LoginRepository {
  LoginRepository(this.api);
  final LoginApi api;

  Future<Either<Failure, String>> loginUser(
      String email, String password) async {
    return handleFutureFunctionsExceptions<String>(
      () async {
        final token = await api.requestLogin(email, password);
        Prefs.prefs.saveToken(token);

        return token;
      },
      onNoException: () => log(Constants.messageLoginSuccess),
    );
  }
}
