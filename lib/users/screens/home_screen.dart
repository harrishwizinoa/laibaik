import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../utils/themes.dart';
import '../widgets/curve_Edge.dart';
import '../widgets/cards/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<String> imageUrls = [
    "assets/images/banner.png",
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
    "assets/images/banner4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Adjusts to approximate 174.75deg
            end: Alignment.bottomCenter,
            stops: [0.0421, 0.9579], // Matches 4.21% and 95.79%
            colors: [
              Color(0xFFFFFFFF), // #FFFFFF
              Color.fromRGBO(253, 206, 207, 0.1), // rgba(253, 206, 207, 0.1)
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: StickyHeaderDelegate(
                minHeight: 150,
                maxHeight: 320,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //SizedBox(height: 20),
                 // carousel(),
                  ServiceGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carousel() {
    return Stack(
      children: [
        CarouselSlider(
          items: imageUrls.map((url) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            height: 150,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
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
                    color: currentIndex == entry.key
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget searchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.red),
          hintText: 'Search for iPhone',
          suffixIcon: Icon(Icons.mic_rounded, color: Colors.red),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
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
            const SizedBox(height: 4),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Genie",
                style: TextStyle(
                  color: AppColors.start,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline,
                color: Color(0xFF28A745), // Use AppColors.middle if needed
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  StickyHeaderDelegate({
    this.minHeight = 135,
    this.maxHeight = 320,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Progress of scroll: 0 (expanded) → 1 (collapsed)
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final double titleFontSize = lerpDouble(22, 16, progress)!;
    final double subtitleFontSize = lerpDouble(14, 10, progress)!;
    final double searchBarHeight = lerpDouble(50, 40, progress)!;
    final double paddingTop = lerpDouble(40, 10, progress)!;
    final double spacing = lerpDouble(16, 8, progress)!;

    return CurveEdge(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Location and Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.white, size: 18),
                          SizedBox(width: 4),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "B 101, Muscat Oman",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  // Profile & Tag
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
                            color: AppColors.start,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline, color: AppColors.middle, size: 20),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: spacing),

              // Search Bar
              Container(
                height: searchBarHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for iPhone',
                    prefixIcon: Icon(Icons.search, color: Colors.red),
                    suffixIcon: Icon(Icons.mic_rounded, color: Colors.red),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight || oldDelegate.maxHeight != maxHeight;
  }
}