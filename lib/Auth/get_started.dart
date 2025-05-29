
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:laibaik/Auth/Google_sign_in.dart';
import 'package:laibaik/apiservice.dart';
import '../modules/controller/controller.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetStartedController()); // Inject controller
    Get.put(ApiService()); // Inject ApiService
    final controller = Get.find<GetStartedController>();
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    final imageList = [
      "assets/images/getstart1.jpg",
      "assets/images/getstart2.jpg",
      "assets/images/getstart3.jpg",
    ];

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
              top: 20,
              right: 20,
              child:Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                       gradient: LinearGradient(
                           colors: [
                         Colors.black54,
                         Colors.white60
                       ]),
                          border: Border.all(color: Colors.white38, width: 2)
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 24,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
                  ),
              ),
          Positioned(
            bottom: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: isTablet ? size.height * 0.4 : size.height * 0.35,
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black54, Colors.white24],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white38, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        controller.titles[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 32 : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Discover amazing deals & Discounts at\nyour fingertips',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(imageList.length, (index) {
                          return Container(
                            width: controller.currentIndex.value == index ? 24 : 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: controller.currentIndex.value == index ? Colors.white : Colors.grey,
                            ),
                          );
                        }),
                      )),
                      SizedBox(height: size.height * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          Get.find<ApiService>().fetchData();
                          Get.to(() => GoogleSignIn());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * (isTablet ? 0.3 : 0.25),
                            vertical: size.height * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            color: Colors.white,
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