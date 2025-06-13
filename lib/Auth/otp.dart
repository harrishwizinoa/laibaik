import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laibaik/users/screens/home_screen.dart';
import 'package:laibaik/utils/themes.dart';
import 'package:pinput/pinput.dart';

import '../main.dart';
import '../users/widgets/curve_Edge.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurveEdge(
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                    SizedBox(height: 70,),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/labbaik.svg',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            Text("forget_password_title".tr, style: TextStyle(color: Colors.black, fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'poppins-medium')),
            SizedBox(height: 25,),
            Text("code_sent".tr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'poppins-medium')),
            SizedBox(height: 30,),
            OtpTextField(),
            SizedBox(height: 25,),
            Text("resend_code".tr, style: TextStyle(color: Colors.black, fontFamily: 'poppins-medium')),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                Get.to(BottomNav());
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
                child: Center(
                  child:Text("continue".tr, style: TextStyle(color: Colors.white, fontFamily: 'poppins-medium')),
                )
              ),
            ),
            // Spacer(),
          ],
        ),
      )
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
  final fillColor =  Colors.white;
  final borderColor = Colors.grey.shade300;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 76,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor,width: 2),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
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
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 24,
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


