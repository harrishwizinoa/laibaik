// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:laibaik/Auth/profile_form.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/background.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           ),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: [
//                  Text(
//                    'Create your Account',
//                    style: TextStyle(
//                      fontSize: 28,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white,
//                    ),
//                  ),
//                  SizedBox(height: 30),
//                  Container(
//                    padding: EdgeInsets.all(20),
//                    decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                            begin: Alignment.topLeft,
//                            end: Alignment.bottomRight,
//                            colors: [Colors.black, Colors.white38]),
//                        color: Colors.black.withOpacity(0.7),
//                        borderRadius: BorderRadius.circular(15),
//                        border: Border.all(color: Colors.white38, width: 2)
//                    ),
//                    child: Column(
//                      children: [
//                        Container(
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(10),
//                              color: Colors.white
//                          ),
//                          child: TextField(
//                            decoration: InputDecoration(
//                              prefixIcon: Icon(Icons.email),
//                              hintText: 'Email',
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(10),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(height: 15),
//                        Container(
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(10),
//                            color: Colors.white
//                          ),
//                          child: TextField(
//                            obscureText: true,
//                            decoration: InputDecoration(
//                              prefixIcon: Icon(Icons.lock),
//                              hintText: 'Password',
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(10),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(height: 15),
//                        Row(
//                          children: [
//                            Checkbox(
//                              value: _rememberMe,
//                              onChanged: (value) {
//                                setState(() {
//                                  _rememberMe = value!;
//                                });
//                              },
//                              side: BorderSide(color: Colors.white),
//                            ),
//                            Text('Remember me',style: TextStyle(color: Colors.white),),
//                            Spacer(),
//                            TextButton(
//                                onPressed: (){},
//                                child: Text("Forget Password?",style: TextStyle(color: Colors.white),),),
//                          ],
//                        ),
//                        SizedBox(height: 15),
//                        ElevatedButton(
//                          onPressed: () {
//                            Get.to(ProfileForm());
//                          },
//                          style: ElevatedButton.styleFrom(
//                            backgroundColor: Colors.red,
//                            minimumSize: Size(double.infinity, 50),
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10),
//                            ),
//                          ),
//                          child: Text(
//                            'SIGN UP',
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 16,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                        SizedBox(height: 20),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Expanded(child: Divider()),
//                            Padding(
//                              padding: const EdgeInsets.symmetric(horizontal: 10),
//                              child: Text('or continue with',style: TextStyle(color: Colors.white),),
//                            ),
//                            Expanded(child: Divider()),
//                          ],
//                        ),
//                        SizedBox(height: 20),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            ElevatedButton(
//                              onPressed: () {},
//                              style: ElevatedButton.styleFrom(
//                                backgroundColor: Colors.white,
//                                shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(10),
//                                ),
//                              ),
//                              child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child:  Image.asset(
//                                  'assets/icons/google.png',
//                                  height: 24,
//                                ),
//                              ),
//                            ),
//                            SizedBox(width: 20),
//                            ElevatedButton(
//                              onPressed: () {},
//                              style: ElevatedButton.styleFrom(
//                                backgroundColor: Colors.white,
//                                shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(10),
//                                ),
//                              ),
//                              child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Icon(
//                                  Icons.apple,
//                                  color: Colors.black,
//                                  size: 30,
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//               ]
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laibaik/Auth/profile_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'create_your_account'.tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black, Colors.white38],
                    ),
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white38, width: 2),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'email'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'password'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            side: BorderSide(color: Colors.white),
                          ),
                          Text('remember_me'.tr, style: TextStyle(color: Colors.white)),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'forget_password'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const ProfileForm());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'sign_up'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'or_continue_with'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 20),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icons/google.png',
                                height: 24,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.apple,
                                color: Colors.black,
                                size: 30,
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
          ),
        ],
      ),
    );
  }
}