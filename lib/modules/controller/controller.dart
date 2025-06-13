// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// class GetStartedController extends GetxController {
//   var currentIndex = 0.obs;
//   var showLanguageDropdown = false.obs;
//   var selectedLanguage = 'English'.obs;
//
//   void updateIndex(int index) {
//     currentIndex.value = index;
//   }
//
//   void toggleLanguageDropdown() {
//     showLanguageDropdown.value = !showLanguageDropdown.value;
//   }
//
//   void selectLanguage(String language) {
//     selectedLanguage.value = language;
//     showLanguageDropdown.value = false;
//     if (language == 'English') {
//       Get.updateLocale(const Locale('en', 'US'));
//     } else if (language == 'العربية') {
//       Get.updateLocale(const Locale('ar', 'SA'));
//     }
//     update();
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetStartedController extends GetxController {
  var currentIndex = 0.obs;
  var showLanguageDropdown = false.obs;
  var selectedLanguage = 'English'.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void toggleLanguageDropdown() {
    showLanguageDropdown.value = !showLanguageDropdown.value;
  }

  void selectLanguage(String language) {
    selectedLanguage.value = language;
    showLanguageDropdown.value = false;
    if (language == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (language == 'العربية') {
      Get.updateLocale(const Locale('ar', 'SA'));
    }
    update();
  }
}

class valueController extends GetxController {


  var isLoading = false.obs;
}