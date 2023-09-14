import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/theme/text_style.dart';
import 'package:mobile/app/widgets/text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 0.9,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlutterLogo(
                      size: size.width * 0.4,
                    ),
                    Text(
                      'Sign In',
                      style: kTextStyleSignInTitle,
                    ),
                    kSpaceVertical32,
                    MTextFormFiled(
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (newValue) => controller.email = newValue,
                      validator: controller.emailValidator,
                    ),
                    kSpaceVertical32,
                    MTextFormFiled(
                      label: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (newValue) => controller.password = newValue,
                      validator: controller.passwordValidator,
                    ),
                    kSpaceVertical16,
                    TextButton(
                        onPressed: () {}, child: Text('Forgot Password?')),
                    kSpaceVertical32,
                    FractionallySizedBox(
                        widthFactor: 0.6,
                        child: ElevatedButton(
                            onPressed: controller.signIn,
                            child: Text('Sign In'))),
                    FractionallySizedBox(
                      widthFactor: 0.6,
                      child: ElevatedButton(
                          onPressed: controller.openRegisterPage,
                          child: Text('Create New Account')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
