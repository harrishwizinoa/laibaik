import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../main.dart';
import '../../utils/themes.dart';
import 'curve_edge.dart';
import 'custom_shape.dart';

class primaryHeader extends StatefulWidget implements PreferredSizeWidget {
  primaryHeader({super.key});

  @override
  State<primaryHeader> createState() => _primaryHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(350);
}

class _primaryHeaderState extends State<primaryHeader> {
  int currentIndex = 0;
  List<String>imageUrls = [
    "assets/images/banner.png",
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
    "assets/images/banner4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CurveEdge(
          child: Container(
            height: 420,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: colors.primaryGradient,
            ),
            child: SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Positioned(
                    top: -150,
                    right: -250,
                    child: Tcircle(
                      backgroundcolor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -300,
                    child: Tcircle(
                      backgroundcolor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                      left: -10,top: 220,
                      child: Tcircle(
                        height:150,
                        width:150,
                        radius:100,
                        backgroundcolor: Colors.white.withOpacity(0.1),)
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "B 101, Muscat Oman",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Genie",
                      style: TextStyle(
                        color: colors.gradientStart, // Match the gradient start color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_outline,
                      color: colors.gradientStart,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 120,
          left: 8,
          right: 8,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.red),
                hintText: 'Search for iPhone',
                suffixIcon: Icon(Icons.mic_rounded, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Positioned(
          top: 190, // Positioned below the search bar
          left: 0,
          right: 0,
          child: Stack(
            children: [
              CarouselSlider(
                items: imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollPhysics: AlwaysScrollableScrollPhysics(),
                  height: 150,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: false,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageUrls.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = entry.key;
                      }),
                      child: Container(
                        width: currentIndex == entry.key ? 18 : 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: currentIndex == entry.key ? Colors.white : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(350);
}

