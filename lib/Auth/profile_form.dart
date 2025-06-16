import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laibaik/main.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import '../utils/themes.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool _rememberMe = false;
  String _selectedGender = 'Male';
  TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double smallSpacing = size.height * 0.015;
    final double mediumSpacing = size.height * 0.02;
    final double largeSpacing = size.height * 0.03;
    final double extraLargeSpacing = size.height * 0.05;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurveEdge(
              child: Container(
                height: size.height * 0.2875,
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
                    SizedBox(height: smallSpacing),
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
              'fill_your_profile'.tr,
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'poppins-medium',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.035,
                vertical: smallSpacing,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'first_name'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'last_name'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _dobController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: 'date_of_birth'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dobController.text =
                            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
                  Text(
                    "Gender (Optional)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins-medium',
                    ),
                  ),
                  SizedBox(height: smallSpacing),
                  Container(
                    height: size.height * 0.0625,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            value: 'Male',
                            activeColor: Colors.black,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                            title: Text('male'.tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            value: 'Female',
                            activeColor: Colors.black,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                            title: Text('female'.tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mediumSpacing),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'phone_number'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 0.5),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
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
                        'receive_offers'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins-medium',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediumSpacing),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => BottomNav(),
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
                          'continue'.tr,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}