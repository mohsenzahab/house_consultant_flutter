import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';

import '../controllers/home_view_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(),
    );
    Get.lazyPut<HomeDataController>(() => HomeDataController());
  }
}
