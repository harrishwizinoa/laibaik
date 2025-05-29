import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Sign_up.dart';

class GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/getstart1.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            // Foreground Content
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02,
                  ),
                  child: Container(
                    width: isLandscape ? size.width * 0.6 : size.width * 0.9,
                    padding: EdgeInsets.all(size.width * 0.05),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let's you in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.height * 0.03),

                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/google.png',
                            height: size.width * 0.06,
                          ),
                          label: Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: Size(double.infinity, size.height * 0.07),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: size.width * 0.08,
                          ),
                          label: Text(
                            "Continue with Apple",
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: Size(double.infinity, size.height * 0.07),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: size.width * 0.08,
                          ),
                          label: Text(
                            "Continue with email",
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            minimumSize: Size(double.infinity, size.height * 0.07),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "Sign Up",
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
      ),
    );
  }
}