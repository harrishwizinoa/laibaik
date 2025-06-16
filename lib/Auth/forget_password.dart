// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:laibaik/users/widgets/curve_Edge.dart';
// import 'package:laibaik/utils/themes.dart';
//
// import 'otp.dart';
//
// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen size using MediaQuery (keeping responsiveness as before)
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     // Determine text direction based on the current locale
//     final isRtl = Get.locale?.languageCode == 'ar';
//
//     return Scaffold(
//       body: Column(
//         children: [
//           CurveEdge(
//             child: Container(
//               height: 230,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   gradient: AppColors.primaryGradient
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 50,),
//                   Padding(
//                     padding: const EdgeInsets.all(14.0),
//                     child: Icon(Icons.arrow_back,color: Colors.white,),
//                   ),
//                   SizedBox(height: 5,),
//                   Center(
//                     child: SvgPicture.asset(
//                       'assets/images/labbaik.svg',
//                       height: 50,
//                       width: 50,
//                     ),
//                   ),
//                   SizedBox(height: 30,),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: isRtl ? 0 : screenWidth * 0.06,
//               right: isRtl ? screenWidth * 0.06 : 0,
//               bottom: 8.0,
//             ),
//             child: Text(
//               'forget_password'.tr, // Use translation key
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: screenWidth * 0.085,
//                 fontWeight: FontWeight.bold,
//                   fontFamily: 'poppins-medium'
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: EdgeInsets.all(screenWidth * 0.03),
//             child: Column(
//               crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: screenHeight * 0.018),
//                 Text(
//                   'select_contact_details'.tr, // Add this key to TranslationService
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: screenWidth * 0.045,
//                       fontFamily: 'poppins'
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.018),
//                 Container(
//                   height: screenHeight * 0.15,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Colors.white, Colors.white38],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(color: Colors.grey.shade300, width: 2),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(width: screenWidth * 0.05),
//                       Container(
//                         height: screenHeight * 0.1,
//                         width: screenHeight * 0.1,
//                         decoration: BoxDecoration(
//                           color: Colors.pinkAccent.shade100.withOpacity(0.2),
//                           borderRadius: const BorderRadius.all(Radius.circular(100)),
//                         ),
//                         child: Center(
//                           child: Image.asset(
//                             "assets/icons/mail.png",
//                             height: screenHeight * 0.031,
//                             width: screenHeight * 0.031,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.05),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'via_email'.tr, // Add this key to TranslationService
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontSize: screenWidth * 0.035,
//                                 fontFamily: 'poppins-medium'
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.01),
//                           Text(
//                             "abcd***@gmail.com", // Email addresses typically aren't translated
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: screenWidth * 0.045,
//                               fontWeight: FontWeight.bold,
//                                 fontFamily: 'poppins-medium'
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.025),
//                 Container(
//                   height: screenHeight * 0.15,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Colors.white, Colors.white38],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(color: Colors.grey.shade300, width: 2)
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(width: screenWidth * 0.05),
//                       Container(
//                         height: screenHeight * 0.1,
//                         width: screenHeight * 0.1,
//                         decoration: BoxDecoration(
//                           color: Colors.pinkAccent.shade100.withOpacity(0.2),
//                           borderRadius: const BorderRadius.all(Radius.circular(100)),
//                         ),
//                         child: Center(
//                           child: Image.asset(
//                             "assets/icons/whatsapp.png",
//                             height: screenHeight * 0.031,
//                             width: screenHeight * 0.031,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.05),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'via_whatsapp'.tr, // Add this key to TranslationService
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontSize: screenWidth * 0.035,
//                                 fontFamily: 'poppins-medium'
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.01),
//                           Text(
//                             "+91 98******65", // Phone numbers typically aren't translated
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: screenWidth * 0.045,
//                               fontWeight: FontWeight.bold,
//                                 fontFamily: 'poppins-medium'
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.025),
//                 Container(
//                   height: screenHeight * 0.1,
//                   width: double.infinity,
//                   decoration:  BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.white, Colors.white38],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(color: Colors.grey.shade300, width: 2)
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(width: screenWidth * 0.05),
//                       Container(
//                         height: screenHeight * 0.0625,
//                         width: screenHeight * 0.0625,
//                         child: Center(
//                           child: Image.asset(
//                             "assets/icons/info.png",
//                             height: screenHeight * 0.031,
//                             width: screenHeight * 0.031,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.05),
//                       Expanded(
//                         flex: 5,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'whatsapp_error_message'.tr,
//                               style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: screenWidth * 0.025,
//                                   fontFamily: 'poppins-medium'
//                               ),
//                               textAlign: isRtl ? TextAlign.end : TextAlign.start,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.025),
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(() => OtpScreen());
//                   },
//                   child: Container(
//                     height: screenHeight * 0.055,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       gradient: AppColors.primaryGradient,
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'continue'.tr,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: screenWidth * 0.04,
//                             fontFamily: 'poppins-medium'
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import 'package:laibaik/utils/themes.dart';
import 'otp.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768; // Breakpoint for tablets

    // Determine text direction based on the current locale
    final isRtl = Get.locale?.languageCode == 'ar';

    return Scaffold(
      body: Column(
        children: [
          CurveEdge(
            child: Container(
              height: screenHeight * 0.28, // 28% of screen height
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.06),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: screenWidth * 0.07, // Relative icon size
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/labbaik.svg',
                      height: screenHeight * 0.06,
                      width: screenHeight * 0.06,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isRtl ? 0 : screenWidth * 0.06,
              right: isRtl ? screenWidth * 0.06 : 0,
              bottom: screenHeight * 0.01,
            ),
            child: Text(
              'forget_password'.tr,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? screenWidth * 0.08 : screenWidth * 0.085,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins-medium',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.018),
                Text(
                  'select_contact_details'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isTablet ? screenWidth * 0.04 : screenWidth * 0.045,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: screenHeight * 0.018),
                Container(
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
                    border: Border.all(color: Colors.grey.shade300, width: screenWidth * 0.005),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Container(
                        height: screenHeight * 0.1,
                        width: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.25)),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/mail.png",
                            height: screenHeight * 0.031,
                            width: screenHeight * 0.031,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            'via_email'.tr,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: isTablet ? screenWidth * 0.03 : screenWidth * 0.035,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "abcd***@gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isTablet ? screenWidth * 0.04 : screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Container(
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
                    border: Border.all(color: Colors.grey.shade300, width: screenWidth * 0.005),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Container(
                        height: screenHeight * 0.1,
                        width: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.25)),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/whatsapp.png",
                            height: screenHeight * 0.031,
                            width: screenHeight * 0.031,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            'via_whatsapp'.tr,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: isTablet ? screenWidth * 0.03 : screenWidth * 0.035,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "+91 98******65",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isTablet ? screenWidth * 0.04 : screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins-medium',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Container(
                  height: screenHeight * 0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
                    border: Border.all(color: Colors.grey.shade300, width: screenWidth * 0.005),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Container(
                        height: screenHeight * 0.0625,
                        width: screenHeight * 0.0625,
                        child: Center(
                          child: Image.asset(
                            "assets/icons/info.png",
                            height: screenHeight * 0.031,
                            width: screenHeight * 0.031,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              'whatsapp_error_message'.tr,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: isTablet ? screenWidth * 0.02 : screenWidth * 0.025,
                                fontFamily: 'poppins-medium',
                              ),
                              textAlign: isRtl ? TextAlign.end : TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const OtpScreen(),
                        transition: Transition.rightToLeft, // Animation type
                        duration: Duration(milliseconds: 500)
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.055,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.025)),
                    ),
                    child: Center(
                      child: Text(
                        'continue'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? screenWidth * 0.035 : screenWidth * 0.04,
                          fontFamily: 'poppins-medium',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}