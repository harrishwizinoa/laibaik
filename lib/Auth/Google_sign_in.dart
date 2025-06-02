// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:laibaik/utils/themes.dart';
// import 'Sign_up.dart';
//
// class GoogleSignIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
//     // return Scaffold(
//     //   body: SafeArea(
//     //     child: Stack(
//     //       children: [
//     //         Container(
//     //           decoration: BoxDecoration(
//     //             image: DecorationImage(
//     //               image: AssetImage('assets/images/sign_in.jpg'),
//     //               fit: BoxFit.cover,
//     //               alignment: Alignment.center,
//     //             ),
//     //           ),
//     //         ),
//     //         // Foreground Content
//     //         Align(
//     //           alignment: Alignment.bottomCenter,
//     //           child: SingleChildScrollView(
//     //             child: Padding(
//     //               padding: EdgeInsets.symmetric(
//     //                 horizontal: size.width * 0.05,
//     //                 vertical: size.height * 0.02,
//     //               ),
//     //               child: Container(
//     //                 width: isLandscape ? size.width * 0.6 : size.width * 0.9,
//     //                 padding: EdgeInsets.all(size.width * 0.05),
//     //                 decoration: BoxDecoration(
//     //                   gradient: LinearGradient(
//     //                     begin: Alignment.topLeft,
//     //                     end: Alignment.bottomRight,
//     //                     colors: [Colors.black, Colors.white38],
//     //                   ),
//     //                   color: Colors.black.withOpacity(0.7),
//     //                   borderRadius: BorderRadius.circular(15),
//     //                   border: Border.all(color: Colors.white38, width: 2),
//     //                 ),
//     //                 child: Column(
//     //                   mainAxisSize: MainAxisSize.min,
//     //                   children: [
//     //                     Text(
//     //                       "Let's you in",
//     //                       style: TextStyle(
//     //                         color: Colors.white,
//     //                         fontSize: size.width * 0.08,
//     //                         fontWeight: FontWeight.bold,
//     //                       ),
//     //                       textAlign: TextAlign.center,
//     //                     ),
//     //                     SizedBox(height: size.height * 0.03),
//     //
//     //                     ElevatedButton.icon(
//     //                       onPressed: () {},
//     //                       icon: Image.asset(
//     //                         'assets/icons/google.png',
//     //                         height: size.width * 0.06,
//     //                       ),
//     //                       label: Text(
//     //                         "Continue with Google",
//     //                         style: TextStyle(fontSize: size.width * 0.04),
//     //                       ),
//     //                       style: ElevatedButton.styleFrom(
//     //                         foregroundColor: Colors.black,
//     //                         backgroundColor: Colors.white,
//     //                         minimumSize: Size(double.infinity, size.height * 0.07),
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(10),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     SizedBox(height: size.height * 0.02),
//     //
//     //                     ElevatedButton.icon(
//     //                       onPressed: () {},
//     //                       icon: Icon(
//     //                         Icons.apple,
//     //                         color: Colors.black,
//     //                         size: size.width * 0.08,
//     //                       ),
//     //                       label: Text(
//     //                         "Continue with Apple",
//     //                         style: TextStyle(fontSize: size.width * 0.04),
//     //                       ),
//     //                       style: ElevatedButton.styleFrom(
//     //                         foregroundColor: Colors.black,
//     //                         backgroundColor: Colors.white,
//     //                         minimumSize: Size(double.infinity, size.height * 0.07),
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(10),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     SizedBox(height: size.height * 0.02),
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           child: Divider(
//     //                             color: Colors.white,
//     //                             thickness: 1,
//     //                           ),
//     //                         ),
//     //                         Padding(
//     //                           padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//     //                           child: Text(
//     //                             "or",
//     //                             style: TextStyle(
//     //                               color: Colors.white,
//     //                               fontSize: size.width * 0.04,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         Expanded(
//     //                           child: Divider(
//     //                             color: Colors.white,
//     //                             thickness: 1,
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                     SizedBox(height: size.height * 0.02),
//     //                     Container(
//     //                       height: size.height * 0.07,
//     //                       decoration: BoxDecoration(
//     //                         gradient: AppColors.primaryGradient,
//     //                         borderRadius: BorderRadius.circular(10),
//     //                       ),
//     //                       child: Row(
//     //                         mainAxisAlignment: MainAxisAlignment.center,
//     //                         children: [
//     //                            Icon(
//     //                             Icons.email,
//     //                             color: Colors.white,
//     //                             size: size.width * 0.08,
//     //                           ),
//     //                           Text(
//     //                             "Continue with email",
//     //                             style: TextStyle(fontSize: size.width * 0.04,color: Colors.white),
//     //                           ),
//     //                         ],
//     //                       ),
//     //                     ),
//     //                     SizedBox(height: size.height * 0.03),
//     //                     Row(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       children: [
//     //                         Text(
//     //                           "Don't have an account? ",
//     //                           style: TextStyle(
//     //                             color: Colors.black54,
//     //                             fontSize: size.width * 0.035,
//     //                           ),
//     //                         ),
//     //                         TextButton(
//     //                           onPressed: () {
//     //                             Get.to(SignUpScreen());
//     //                           },
//     //                           child: Text(
//     //                             "Sign Up",
//     //                             style: TextStyle(
//     //                               color: Colors.black,
//     //                               fontSize: size.width * 0.035,
//     //                               fontWeight: FontWeight.bold,
//     //                               decoration: TextDecoration.underline,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/sign_in.jpg'),
//                   fit: BoxFit.cover,
//                   alignment: Alignment.center,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: size.width * 0.05,
//                     vertical: size.height * 0.02,
//                   ),
//                   child: Container(
//                     width: isLandscape ? size.width * 0.7 : size.width * 0.9,
//                     padding: EdgeInsets.all(size.width * 0.05),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Colors.black.withOpacity(0.8), Colors.white.withOpacity(0.4)],
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white38, width: 2),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'lets_you_in'.tr,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: size.width * 0.08,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                           semanticsLabel: 'lets_you_in'.tr,
//                         ),
//                         SizedBox(height: size.height * 0.03),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             // Placeholder for Google Sign-In logic
//                             print('Google Sign-In triggered');
//                           },
//                           icon: Image.asset(
//                             'assets/icons/google.png',
//                             height: size.width * 0.06,
//                           ),
//                           label: Text(
//                             'continue_with_google'.tr,
//                             style: TextStyle(fontSize: size.width * 0.04),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.black,
//                             backgroundColor: Colors.white,
//                             minimumSize: Size(double.infinity, size.height * 0.07),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             // Placeholder for Apple Sign-In logic
//                             print('Apple Sign-In triggered');
//                           },
//                           icon: Icon(
//                             Icons.apple,
//                             color: Colors.black,
//                             size: size.width * 0.08,
//                           ),
//                           label: Text(
//                             'continue_with_apple'.tr,
//                             style: TextStyle(fontSize: size.width * 0.04),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.black,
//                             backgroundColor: Colors.white,
//                             minimumSize: Size(double.infinity, size.height * 0.07),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Divider(color: Colors.white, thickness: 1),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                               child: Text(
//                                 'or'.tr,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: size.width * 0.04,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Divider(color: Colors.white, thickness: 1),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         GestureDetector(
//                           onTap: () {
//                             // Placeholder for email sign-in navigation
//                             Get.toNamed('/email-signin');
//                           },
//                           child: Container(
//                             height: size.height * 0.07,
//                             decoration: BoxDecoration(
//                               gradient: AppColors.primaryGradient,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.email,
//                                   color: Colors.white,
//                                   size: size.width * 0.08,
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   'continue_with_email'.tr,
//                                   style: TextStyle(
//                                     fontSize: size.width * 0.04,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.03),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'dont_have_account'.tr,
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: size.width * 0.035,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Get.to(() =>  SignUpScreen());
//                               },
//                               child: Text(
//                                 'sign_up'.tr,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: size.width * 0.035,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laibaik/utils/themes.dart';
import 'sign_up.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final isLandscape = MediaQuery
        .of(context)
        .orientation == Orientation.landscape;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sign_in.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                child: Container(
                  width: isLandscape ? size.width * 0.7 : size.width * 0.9,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.white.withOpacity(0.4)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white38, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'lets_you_in'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.03),
                      ElevatedButton.icon(
                        onPressed: () {
                          print('Google Sign-In triggered');
                        },
                        icon: Image.asset(
                          'assets/icons/google.png',
                          height: size.width * 0.06,
                        ),
                        label: Text(
                          'continue_with_google'.tr,
                          style: TextStyle(fontSize: size.width * 0.04),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(
                              double.infinity, size.height * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      ElevatedButton.icon(
                        onPressed: () {
                          print('Apple Sign-In triggered');
                        },
                        icon: Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: size.width * 0.08,
                        ),
                        label: Text(
                          'continue_with_apple'.tr,
                          style: TextStyle(fontSize: size.width * 0.04),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(
                              double.infinity, size.height * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.white, thickness: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Text(
                              'or'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white, thickness: 1),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpScreen());
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dont_have_account'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const SignUpScreen());
                            },
                            child: Text(
                              'sign_up'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
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