import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laibaik/Auth/forget_password.dart';
import 'package:laibaik/Auth/profile_form.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import '../utils/themes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = false;

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
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: smallSpacing,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'create_your_account'.tr,
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'poppins-medium',
                  ),
                ),
                SizedBox(height: largeSpacing),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFE6E6E6)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'email'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mediumSpacing),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFE6E6E6)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'password'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mediumSpacing),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        Text(
                          'remember_me'.tr,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins-medium',
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(() => ForgetPassword(),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 500)
                            );
                          },
                          child: Text(
                            'forget_password'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediumSpacing),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileForm(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500)
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: AppColors.primaryGradient,
                        ),
                        width: double.infinity,
                        height: size.height * 0.0625,
                        child: Center(
                          child: Text(
                            'sign_up'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mediumSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                          child: Text(
                            'or_continue_with'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: mediumSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(smallSpacing),
                            child: Image.asset(
                              'assets/icons/google.png',
                              height: size.height * 0.03,
                            ),
                          ),
                        ),
                        SizedBox(width: mediumSpacing),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(smallSpacing),
                            child: Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: size.height * 0.0375,
                            ),
                          ),
                        ),
                      ],
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