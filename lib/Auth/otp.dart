import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laibaik/utils/themes.dart';
import 'package:pinput/pinput.dart';
import '../main.dart';
import '../users/widgets/curve_Edge.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double smallSpacing = size.height * 0.015;
    final double mediumSpacing = size.height * 0.02;
    final double largeSpacing = size.height * 0.03;
    final double extraLargeSpacing = size.height * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    SizedBox(height: size.height * 0.0875),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/labbaik.svg',
                        height: size.height * 0.0625,
                        width: size.height * 0.0625,
                      ),
                    ),
                    SizedBox(height: largeSpacing),
                  ],
                ),
              ),
            ),
            Text(
              "forget_password_title".tr,
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.085,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins-medium',
              ),
            ),
            SizedBox(height: largeSpacing),
            Text(
              "code_sent".tr,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins-medium',
              ),
            ),
            SizedBox(height: largeSpacing),
            OtpTextField(),
            SizedBox(height: largeSpacing),
            Text(
              "resend_code".tr,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins-medium',
              ),
            ),
            SizedBox(height: largeSpacing),
            GestureDetector(
              onTap: () {
                Get.to(() => BottomNav(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500)
                );
              },
              child: Container(
                margin: EdgeInsets.all(smallSpacing),
                height: size.height * 0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "continue".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontFamily: 'poppins-medium',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpTextField extends StatefulWidget {
  const OtpTextField({super.key});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  final focusedBorderColor = Colors.red;
  final fillColor = Colors.white;
  final borderColor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double smallSpacing = size.height * 0.015;

    final defaultPinTheme = PinTheme(
      width: size.width * 0.19,
      height: size.height * 0.07,
      textStyle: TextStyle(
        fontSize: size.width * 0.055,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 2),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: smallSpacing),
                    width: size.width * 0.06,
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}