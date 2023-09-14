import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/values/durations.dart';
import 'package:mobile/app/modules/home/controllers/data_controller.dart';
import 'package:mobile/app/modules/home/views/filter_form.dart';
import 'package:mobile/app/modules/home/views/video_gallery.dart';
import 'package:mobile/app/routes/app_pages.dart';

class HomeViewController extends GetxController
    with GetTickerProviderStateMixin {
  final int idHomeBody = 0;
  final int idPropertyView = 1;
  final int idMainInfo = 2;
  final int idBackButton = 3;
  final int idPhone = 4;
  final int idFilterButton = 5;
  final int idAddDataBuilder = 6;
  final int idCategoryView = 7;

  final List<InfoRoute> _routes = [];
  MainRoute currentRoute = MainRoute.property;

  bool isFilterOpen = false;
  bool addDataMenuOpen = true;
  bool singleDataForm = false;

  ScrollController scrollController = ScrollController();

  HomeDataController get dataController => Get.find<HomeDataController>();

  void _push(InfoRoute view) {
    _routes.add(view);
  }

  void _pop() {
    _routes.removeLast();
  }

  void selectCategory() => {
        update([idPropertyView])
      };

  InfoRoute get currentView => _routes.last;

  @override
  void onInit() {
    super.onInit();
    _push(InfoRoute.main);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void toProfilePage() {
    Get.toNamed(Routes.PROFILE);
  }

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }

  void toLoginPage() {
    Get.toNamed(Routes.LOGIN);
  }

  void selectProperty() {
    update([idPropertyView]);
  }

  void reSelectProperty() {
    scrollController.animateTo(0,
        duration: kDurationPageTransition, curve: Curves.linear);
    update([idPropertyView]);
  }

  void closePropertyInfo() {
    dataController.unSelectProperty();
    update([idPropertyView]);
  }

  // void toggleMoreInfo() {
  //   if (infoView == InfoView.main) {
  //     infoView = InfoView.extra;
  //   } else {
  //     infoView = InfoView.main;
  //   }
  //   update([idMainInfo, idInfoButton]);
  // }

  void handleBackButton() {
    if (currentView == InfoRoute.main) {
      _push(InfoRoute.extra);
    } else {
      _pop();
    }
    update([idMainInfo, idBackButton, idPhone, idPropertyView]);
  }

  Future<bool> handleBack() async {
    if (isFilterOpen) {
      closeFilterForm();
      return false;
    }
    switch (currentView) {
      case InfoRoute.main:
        closePropertyInfo();

        break;
      default:
        _pop();
        update([idMainInfo, idBackButton, idPhone, idPropertyView]);
    }

    return false;
  }

  void showPhones() {
    _push(InfoRoute.phone);
    final ids;
    switch (currentView) {
      case InfoRoute.main:
        ids = [idPhone, idMainInfo, idPropertyView, idBackButton];
        break;
      case InfoRoute.extra:
        ids = [idPhone, idMainInfo];
        break;
      case InfoRoute.phone:
        ids = [idPhone, idMainInfo, idPropertyView, idBackButton];
        break;
    }
    update(ids);
  }

  // void closePhones() {
  //   if (infoView != InfoView.phone) return;
  // }

  void toVideoGallery() {
    Get.to(() => const VideoGallery());
  }

  void openFilterForm() {
    isFilterOpen = true;
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: FilterForm(),
    ));

    // update([idPropertyView, idFilterButton]);
  }

  void closeFilterForm() {
    isFilterOpen = false;
    Get.back();
    // update([idPropertyView, idFilterButton]);
  }

  void openAddDataPage() {
    if (currentRoute == MainRoute.addData) return Get.back();
    currentRoute = MainRoute.addData;
    Get.back();
    update([idHomeBody]);
  }

  void openPropertyPage() {
    if (currentRoute == MainRoute.property) return Get.back();
    currentRoute = MainRoute.property;
    Get.back();
    update([idHomeBody]);
  }

  void openDataForm() {
    addDataMenuOpen = false;
    update([idAddDataBuilder]);
  }

  void openDataFormSingleFile() {
    addDataMenuOpen = false;
    singleDataForm = true;
    update([idAddDataBuilder]);
  }

  Future<bool> handleAddDataFormBack() async {
    if (!addDataMenuOpen) {
      addDataMenuOpen = true;
    }
    update([idAddDataBuilder]);
    return false;
  }

  void unSelectCategory() => {
        update([idPropertyView])
      };
}

enum InfoRoute {
  main,
  extra,
  phone,
}

enum MainRoute {
  property,
  addData,
}
