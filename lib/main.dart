// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:laibaik/users/screens/categories.dart';
// import 'package:laibaik/users/screens/home_screen.dart';
// import 'package:laibaik/utils/themes.dart';
//
// import 'Auth/get_started.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     AppColors colors = AppColors();
//     return GetMaterialApp(
//       home:GetStarted(),
//     );
//   }
// }
//
// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});
//
//   @override
//   _BottomNavState createState() => _BottomNavState();
// }
//
// class _BottomNavState extends State<BottomNav> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _pages = <Widget>[
//     HomePage(),
//     Categories(),
//     Center(child: Text('nav_order')),
//    Center(child: Text('nav_offer_zone')),
//    Center(child: Text('nav_favorites')),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               _selectedIndex == 0 ? 'assets/icons/home-fill.svg' : 'assets/icons/home.svg',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               _selectedIndex == 1 ? 'assets/icons/category-fill.svg' : 'assets/icons/category.svg',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               _selectedIndex == 2 ? 'assets/icons/package-fill.svg' : 'assets/icons/package.svg',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Order'.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               _selectedIndex == 3 ? 'assets/icons/percent-fill.svg' : 'assets/icons/percentage.svg',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Offer zone',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               _selectedIndex == 4 ? 'assets/icons/heart-fill.svg' : 'assets/icons/heart.svg',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Favorites',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
//
//
//
//
//


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laibaik/modules/controller/controller.dart';

import 'package:laibaik/translation.dart';
import 'package:laibaik/users/screens/categories.dart';
import 'package:laibaik/users/screens/categories/FoodAndgrocery/food_and_grocery.dart';
import 'package:laibaik/users/screens/categories/FoodAndgrocery/viewHotel.dart';
import 'package:laibaik/users/screens/home_screen.dart';
import 'package:laibaik/utils/themes.dart';

import 'Auth/get_started.dart';

void main() {
  Get.put(valueController());
  //runApp(BottomNav());
  runApp(const MyApp());
}
final valueController vController = Get.put(valueController());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return GetMaterialApp(
      translations: TranslationService(), // Add translations
      locale: const Locale('en', 'US'), // Default locale
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      home: const GetStarted(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Obx(
              () => Stack(
            children: [
              child!,
              if (vController.isLoading.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.red),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const Categories(),
    //Viewhotel(restaurantData: {},),
     Center(child: Text('nav_order'.tr)),
    Center(child: Text('nav_offer_zone'.tr)),
    Center(child: Text('nav_favorites'.tr)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0 ? 'assets/icons/home-fill.svg' : 'assets/icons/home.svg',
              width: 24,
              height: 24,
            ),
            label: 'nav_home'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1 ? 'assets/icons/category-fill.svg' : 'assets/icons/category.svg',
              width: 24,
              height: 24,
            ),
            label: 'nav_categories'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2 ? 'assets/icons/package-fill.svg' : 'assets/icons/package.svg',
              width: 24,
              height: 24,
            ),
            label: 'nav_order'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3 ? 'assets/icons/percent-fill.svg' : 'assets/icons/percentage.svg',
              width: 24,
              height: 24,
            ),
            label: 'nav_offer_zone'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 4 ? 'assets/icons/heart-fill.svg' : 'assets/icons/heart.svg',
              width: 24,
              height: 24,
            ),
            label: 'nav_favorites'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
