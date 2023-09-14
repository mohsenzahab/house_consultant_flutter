import 'package:get/get.dart';
import 'package:mobile/app/modules/login/data/login_api.dart';
import 'package:mobile/app/modules/login/data/login_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final repository = LoginRepository(LoginApi());
    Get.lazyPut<LoginController>(
      () => LoginController()..init(repository),
    );
  }
}
