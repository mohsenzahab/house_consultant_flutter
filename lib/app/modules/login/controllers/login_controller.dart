import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/error/error_handler.dart';
import 'package:mobile/app/modules/login/data/login_repository.dart';
import 'package:mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  String? email;
  String? password;
  bool _wrongPassword = false;
  late final LoginRepository repository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init(LoginRepository repository) {
    this.repository = repository;
  }

  void toRegisterPage() {
    Get.offAndToNamed(Routes.REGISTER);
  }

  void openRegisterPage() => Get.offAndToNamed(Routes.REGISTER);

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await repository.loginUser(email!, password!);
      result.fold(handleFailure, (token) {});
      _wrongPassword = false;
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Provide your email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Type your password';
    } else if (_wrongPassword) {
      return 'Password is wrong';
    }
    return null;
  }
}
