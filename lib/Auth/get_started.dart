// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:laibaik/Auth/Google_sign_in.dart';
// import 'package:laibaik/apiservice.dart';
// import 'package:laibaik/users/screens/home_screen.dart';
// import 'package:laibaik/utils/themes.dart';
// import '../modules/controller/controller.dart';
//
// class GetStarted extends StatelessWidget {
//   const GetStarted({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(GetStartedController());
//     Get.put(ApiService());
//     final controller = Get.find<GetStartedController>();
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600;
//
//     final imageList = [
//       "assets/images/getstart1.jpg",
//       "assets/images/getstart2.jpg",
//       "assets/images/getstart3.jpg",
//     ];
//
//     void selectLanguage(String language) {
//       if (language == 'English') {
//         Get.updateLocale(const Locale('en', 'US'));
//       } else if (language == 'العربية') {
//         Get.updateLocale(const Locale('ar', 'SA'));
//       }
//       controller.toggleLanguageDropdown();
//     }
//
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               height: double.infinity,
//               viewportFraction: 1.0,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               onPageChanged: (index, reason) {
//                 controller.updateIndex(index);
//               },
//             ),
//             items: imageList.map((imagePath) {
//               return Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(imagePath),
//                     fit: BoxFit.cover,
//                     colorFilter: const ColorFilter.mode(
//                       Colors.black26,
//                       BlendMode.darken,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: Obx(() => Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     controller.toggleLanguageDropdown();
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: const LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Colors.black54, Colors.white60],
//                       ),
//                       border: Border.all(color: Colors.white38, width: 2),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         const Icon(
//                           Icons.language,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                         Icon(
//                           controller.showLanguageDropdown.value
//                               ? Icons.keyboard_arrow_up_outlined
//                               : Icons.keyboard_arrow_down_outlined,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (controller.showLanguageDropdown.value) ...[
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       selectLanguage('English');
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         gradient: controller.selectedLanguage.value == 'English'
//                             ? AppColors.primaryGradient
//                             : const LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [Colors.black54, Colors.white60],
//                         ),
//                         border: Border.all(color: Colors.white38, width: 2),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "English",
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       selectLanguage('العربية');
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         gradient: controller.selectedLanguage.value == 'العربية'
//                             ? AppColors.primaryGradient
//                             : const LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [Colors.black54, Colors.white60],
//                         ),
//                         border: Border.all(color: Colors.white38, width: 2),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "العربية",
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             )),
//           ),
//           Positioned(
//             bottom: size.height * 0.05,
//             left: size.width * 0.05,
//             right: size.width * 0.05,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(
//                   height: isTablet ? size.height * 0.4 : size.height * 0.35,
//                   width: double.infinity,
//                   padding: EdgeInsets.all(size.width * 0.05),
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [Colors.black54, Colors.white24],
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.white38, width: 2),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Obx(() => Text(
//                         'welcome_title_${controller.currentIndex.value + 1}'.tr,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: isTablet ? 32 : 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontFamily: "poppins-bold",
//                         ),
//                       )),
//                       SizedBox(height: size.height * 0.015),
//                       Text(
//                         'discover_text'.tr,
//                         style: TextStyle(
//                           fontSize: isTablet ? 18 : 16,
//                           color: Colors.white70,
//                           fontFamily: "poppins-medium",
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                       Obx(() => Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: List.generate(imageList.length, (index) {
//                           return Container(
//                             width: controller.currentIndex.value == index ? 42 : 12,
//                             height: 12,
//                             margin: EdgeInsets.symmetric(horizontal: size.width * 0.008),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: controller.currentIndex.value == index ? Colors.white : Colors.grey,
//                             ),
//                           );
//                         }),
//                       )),
//                       SizedBox(height: size.height * 0.03),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(() => const GoogleSignIn());
//                         },
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             gradient: AppColors.primaryGradient,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'get_started'.tr,
//                               style: TextStyle(
//                                 fontSize: isTablet ? 18 : 16,
//                                 color: Colors.white,
//                                 fontFamily: 'poppins-medium'
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:laibaik/Auth/Google_sign_in.dart';
import 'package:laibaik/apiservice.dart';
import 'package:laibaik/users/screens/home_screen.dart';
import 'package:laibaik/utils/themes.dart';
import '../modules/controller/controller.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetStartedController());
    Get.put(ApiService());
    final controller = Get.find<GetStartedController>();
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 768; // Adjusted breakpoint for tablets

    final imageList = [
      "assets/images/getstart1.jpg",
      "assets/images/getstart2.jpg",
      "assets/images/getstart3.jpg",
    ];

    void selectLanguage(String language) {
      if (language == 'English') {
        Get.updateLocale(const Locale('en', 'US'));
      } else if (language == 'العربية') {
        Get.updateLocale(const Locale('ar', 'SA'));
      }
      controller.toggleLanguageDropdown();
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                controller.updateIndex(index);
              },
            ),
            items: imageList.map((imagePath) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.black26,
                      BlendMode.darken,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Positioned(
            top: size.height * 0.05, // Relative to screen height
            right: size.width * 0.05, // Relative to screen width
            child: Obx(() => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleLanguageDropdown();
                  },
                  child: Container(
                    height: size.height * 0.06, // 6% of screen height
                    width: size.width * 0.18, // 18% of screen width
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.04), // Relative radius
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black54, Colors.white60],
                      ),
                      border: Border.all(color: Colors.white38, width: size.width * 0.005),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                          size: size.width * 0.06, // Relative icon size
                        ),
                        Icon(
                          controller.showLanguageDropdown.value
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                          size: size.width * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.showLanguageDropdown.value) ...[
                  SizedBox(height: size.height * 0.015),
                  GestureDetector(
                    onTap: () {
                      selectLanguage('English');
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                        gradient: controller.selectedLanguage.value == 'English'
                            ? AppColors.primaryGradient
                            : const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.black54, Colors.white60],
                        ),
                        border: Border.all(color: Colors.white38, width: size.width * 0.005),
                      ),
                      child: Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.04, // Relative font size
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  GestureDetector(
                    onTap: () {
                      selectLanguage('العربية');
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                        gradient: controller.selectedLanguage.value == 'العربية'
                            ? AppColors.primaryGradient
                            : const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.black54, Colors.white60],
                        ),
                        border: Border.all(color: Colors.white38, width: size.width * 0.005),
                      ),
                      child: Center(
                        child: Text(
                          "العربية",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            )),
          ),
          Positioned(
            bottom: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.05),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: isTablet ? size.height * 0.38 : size.height * 0.35, // Slightly taller for tablets
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black54, Colors.white24],
                    ),
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                    border: Border.all(color: Colors.white38, width: size.width * 0.005),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        'welcome_title_${controller.currentIndex.value + 1}'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? size.width * 0.08 : size.width * 0.07, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "poppins-bold",
                        ),
                      )),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'discover_text'.tr,
                        style: TextStyle(
                          fontSize: isTablet ? size.width * 0.045 : size.width * 0.04,
                          color: Colors.white70,
                          fontFamily: "poppins-medium",
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(imageList.length, (index) {
                          return Container(
                            width: controller.currentIndex.value == index
                                ? size.width * 0.1
                                : size.width * 0.03,
                            height: size.height * 0.015,
                            margin: EdgeInsets.symmetric(horizontal: size.width * 0.008),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(size.width * 0.025),
                              color: controller.currentIndex.value == index ? Colors.white : Colors.grey,
                            ),
                          );
                        }),
                      )),
                      SizedBox(height: size.height * 0.03),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const GoogleSignIn(), transition: Transition.rightToLeft, // Animation type
                              duration: Duration(milliseconds: 500));
                        },
                        child: Container(
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(size.width * 0.025),
                          ),
                          child: Center(
                            child: Text(
                              'get_started'.tr,
                              style: TextStyle(
                                fontSize: isTablet ? size.width * 0.045 : size.width * 0.04,
                                color: Colors.white,
                                fontFamily: 'poppins-medium',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}