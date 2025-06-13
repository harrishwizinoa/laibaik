// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:laibaik/utils/themes.dart';
//
// import 'otp.dart';
//
// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//         image: DecorationImage(image: AssetImage("assets/images/forget1.png"),fit: BoxFit.cover),
//         ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 25,bottom: 8.0,right: 25),
//               child: Text("Forget Password",style:TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
//             ),
//             SizedBox(height: 15,),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Container(
//                 height: 600,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.black,Colors.white38],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                   ),
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                   border: Border.all(color: Colors.white54,width: 2),),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 15,),
//                       Text("Select which contact details should we use\nto reset your password",style: TextStyle(color: Colors.white,fontSize: 22),),
//                       SizedBox(height: 15,),
//                       Container(
//                         height: 120,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.white,Colors.white38],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border: Border.all(color: Colors.white54,width: 2)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(width: 20,),
//                             Container(
//                               height: 80,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: Colors.pinkAccent.shade100.withOpacity(0.2),
//                                 borderRadius: BorderRadius.all(Radius.circular(100)),
//                               ),
//                               child: Center(
//                                 child: Image.asset("assets/icons/mail.png",height: 25,width: 25,)
//                               ),
//                             ),
//                             SizedBox(width: 20,),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("via Email",style: TextStyle(color: Colors.black38),),
//                                 SizedBox(height: 8,),
//                                 Text("abcd***@gmail.com",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
//                               ],
//                             ),
//                             Spacer()
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Container(
//                         height: 120,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.white,Colors.white38],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(20))
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(width: 20,),
//                             Container(
//                               height: 80,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: Colors.pinkAccent.shade100.withOpacity(0.2),
//                                 borderRadius: BorderRadius.all(Radius.circular(100)),
//                               ),
//                               child: Center(
//                                   child: Image.asset("assets/icons/whatsapp.png",height: 25,width: 25,)
//                               ),
//                             ),
//                             SizedBox(width: 20,),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("via Whatsapp",style: TextStyle(color: Colors.black38),),
//                                 SizedBox(height: 8,),
//                                 Text("+91 98******65",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
//                               ],
//                             ),
//                             Spacer()
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Container(
//                         height: 80,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.white,Colors.white38],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(20))
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(width: 20,),
//                             Container(
//                               height: 50,
//                               width: 50,
//
//                               child: Center(
//                                   child: Image.asset("assets/icons/info.png",height: 25,width: 25,)
//                               ),
//                             ),
//                             SizedBox(width: 20,),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   """We can't seem to find the right whatsapp number\naddress for you, resend the whatsapp that you have\nregistered""",
//                                   style: TextStyle(color: Colors.black54,fontSize: 9),
//                                   textAlign: TextAlign.start, // Automatically aligns text (e.g., centered)
//                                 ),
//                               ],
//                             ),
//                             Spacer()
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(()=>OtpScreen());
//                         },
//                         child: Container(
//                           height: 60,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             gradient: AppColors.primaryGradient,
//                             borderRadius: BorderRadius.all(Radius.circular(20))
//                           ),
//                           child: Center(
//                             child: Text("Continue",style: TextStyle(color: Colors.white),),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 ),
//               ),
//           ],
//       ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import 'package:laibaik/utils/themes.dart';

import 'otp.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery (keeping responsiveness as before)
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine text direction based on the current locale
    final isRtl = Get.locale?.languageCode == 'ar';

    return Scaffold(
      body: Column(
        children: [
          CurveEdge(
            child: Container(
              height: 230,
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
                  SizedBox(height: 5,),
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
          Padding(
            padding: EdgeInsets.only(
              left: isRtl ? 0 : screenWidth * 0.06,
              right: isRtl ? screenWidth * 0.06 : 0,
              bottom: 8.0,
            ),
            child: Text(
              'forget_password'.tr, // Use translation key
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.085,
                fontWeight: FontWeight.bold,
                  fontFamily: 'poppins-medium'
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
                  'select_contact_details'.tr, // Add this key to TranslationService
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.045,
                      fontFamily: 'poppins'
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
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
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
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                            'via_email'.tr, // Add this key to TranslationService
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: screenWidth * 0.035,
                                fontFamily: 'poppins-medium'
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "abcd***@gmail.com", // Email addresses typically aren't translated
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                                fontFamily: 'poppins-medium'
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
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey.shade300, width: 2)
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
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                            'via_whatsapp'.tr, // Add this key to TranslationService
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: screenWidth * 0.035,
                                fontFamily: 'poppins-medium'
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "+91 98******65", // Phone numbers typically aren't translated
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                                fontFamily: 'poppins-medium'
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
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.grey.shade300, width: 2)
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
                                fontSize: screenWidth * 0.025,
                                  fontFamily: 'poppins-medium'
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
                    Get.to(() => OtpScreen());
                  },
                  child: Container(
                    height: screenHeight * 0.055,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'continue'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                            fontFamily: 'poppins-medium'
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