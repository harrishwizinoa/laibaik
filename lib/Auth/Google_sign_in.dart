import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import 'package:laibaik/utils/themes.dart';
import 'sign_up.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double smallSpacing = size.height * 0.015;
    final double mediumSpacing = size.height * 0.02;
    final double largeSpacing = size.height * 0.03;
    final double extraLargeSpacing = size.height * 0.05;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Column(
        children: [
          CurveEdge(
            child: Container(
              height: size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: extraLargeSpacing),
                  Padding(
                    padding: EdgeInsets.all(smallSpacing),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.085),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/labbaik.svg',
                      height: size.height * 0.0625,
                      width: size.height * 0.0625,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(smallSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'lets_you_in'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins-medium',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: largeSpacing),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Image.asset(
                    'assets/icons/google.png',
                    height: size.width * 0.06,
                  ),
                  label: Text(
                    'continue_with_google'.tr,
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'poppins-medium',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xFFE6E6E6),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mediumSpacing),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.apple,
                    color: Colors.black,
                    size: size.width * 0.08,
                  ),
                  label: Text(
                    'continue_with_apple'.tr,
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'poppins-medium',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xFFE6E6E6),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mediumSpacing),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Text(
                        'or'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontFamily: 'poppins-medium',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: mediumSpacing),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUpScreen(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500)
                    );
                  },
                  child: Container(
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                          size: size.width * 0.08,
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'continue_with_email'.tr,
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.white,
                            fontFamily: 'poppins-medium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: largeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont_have_account'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.035,
                        fontFamily: 'poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500)
                        );
                      },
                      child: Text(
                        'sign_up'.tr,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}