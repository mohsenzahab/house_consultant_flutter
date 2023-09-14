import 'package:get/get.dart';
import 'package:mobile/app/modules/register/data/register_api.dart';
import 'package:mobile/app/modules/register/data/register_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    final registerApi = RegisterApi();
    final registerRepository = RegisterRepository(registerApi);
    Get.lazyPut<RegisterController>(
      () => RegisterController()..init(registerRepository),
    );
  }
}
