import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:laibaik/users/screens/categories.dart';
import 'package:laibaik/users/screens/home_screen.dart';
import 'package:laibaik/utils/themes.dart';
import 'Auth/get_started.dart';

AppColors colors = AppColors();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await colors.assignColor(); // ✅ wait for colors to load before app runs
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:GetStarted(),
      //BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Categories(),
    Center(child: Text('Order Page')),
    Center(child: Text('Offer Page')),
    Center(child: Text('Favorites Page')),
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1 ? 'assets/icons/category-fill.svg' : 'assets/icons/category.svg',
              width: 24,
              height: 24,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2 ? 'assets/icons/package-fill.svg' : 'assets/icons/package.svg',
              width: 24,
              height: 24,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3 ? 'assets/icons/percent-fill.svg' : 'assets/icons/percentage.svg',
              width: 24,
              height: 24,
            ),
            label: 'Offer Zone',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 4 ? 'assets/icons/heart-fill.svg' : 'assets/icons/heart.svg',
              width: 24,
              height: 24,
            ),
            label: 'Favorites',
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