import 'dart:ui';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laibaik/apiservice.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import 'package:laibaik/utils/themes.dart';

import '../../../../main.dart';
import '../../../widgets/cards/widgets.dart';

ApiService apiService = ApiService();

class FoodAndGrocery extends StatefulWidget {
  const FoodAndGrocery({super.key});

  @override
  State<FoodAndGrocery> createState() => _FoodAndGroceryState();
}

class _FoodAndGroceryState extends State<FoodAndGrocery> with TickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> foodData = [];
  List<dynamic> mindData = [];
  List<dynamic> bannerData = [];
  List<dynamic> restaurant = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  void fetch() async {
    vController.isLoading.value = true;
    try {
      var data = await apiService.data();
      setState(() {
        foodData = data['foodData'] ?? [];
        mindData = data['mindData'] ?? [];
        bannerData = data['bannerData'] ?? [];
        restaurant = data['cardData'] ?? [];
      });
    } finally {
      vController.isLoading.value = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(tabController: _tabController),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0), // Padding to prevent content behind tab bar
            sliver: SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  if (_tabController.index == 0) {
                    return Food(foodData: foodData, mindData: mindData, bannerData: bannerData, AllRestaurant: restaurant,);
                  } else if (_tabController.index == 1) {
                    return const Grocery();
                  } else {
                    return const Dineout();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight = 185;
  final double maxHeight = 320;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final double titleFontSize = lerpDouble(22, 16, progress)!;
    final double subtitleFontSize = lerpDouble(14, 10, progress)!;
    final double searchBarHeight = lerpDouble(50, 40, progress)!;
    // final double paddingTop = lerpDouble(40, 10, progress)!;
    final double spacing = lerpDouble(16, 8, progress)!;

    final double systemTopPadding = MediaQuery.of(context).padding.top;
    final double paddingTop = systemTopPadding + lerpDouble(14, 10, progress)!;

    return CurvesEdge(
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_pin, color: Colors.white, size: 18),
                          const SizedBox(width: 4),
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
                      const SizedBox(height: 4),
                      Text(
                        "B 101, Muscat Oman",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: Colors.white.withOpacity(0.8),
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
                        child: const Text(
                          "Genie",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline, color: Colors.green, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: spacing),
              Container(
                height: searchBarHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
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
  bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) => false;
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;

  StickyTabBarDelegate({required this.tabController});

  @override
  double get minExtent => 66;

  @override
  double get maxExtent => 66;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xffF5F5F5), // Solid background to prevent content showing through
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SegmentedTabControl(
          controller: tabController,
          indicatorPadding: const EdgeInsets.all(4),
          tabPadding: const EdgeInsets.all(14),
          squeezeIntensity: 3,
          barDecoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          indicatorDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          selectedTabTextColor: Colors.red,
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "poppins-medium"),
          tabTextColor: Colors.black87,
          height: 70,
          tabs: const [
            SegmentTab(label: 'Food'),
            SegmentTab(label: 'Grocery'),
            SegmentTab(label: 'Dineout'),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant StickyTabBarDelegate oldDelegate) => tabController != oldDelegate.tabController;
}


class Food extends StatelessWidget {
  final List<dynamic> foodData;
  final List<dynamic> mindData;
  final List<dynamic> bannerData;
  final List<dynamic> AllRestaurant;

  const Food({
    super.key,
    required this.foodData,
    required this.mindData,
    required this.bannerData,
    required this.AllRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Top Most Restaurant", onSeeAll: (){}),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: foodData.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CardWidget(data: foodData[index], cardType: 'food'),
            ),
          ),
        ),
        SectionHeader(title: "What Your Mind ?", onSeeAll: (){}),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: mindData.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CardWidget(data: mindData[index], cardType: 'mind'),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Carousel(bannerData: bannerData),
        const SectionHeader(title: "More on labbaik", onSeeAll: null),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MoreCard(
              title: "OFFER\nZONE",
              image: "assets/images/3moreOn.png",
              imageSize: 70,
            ),
            MoreCard(
              title: "DEAL OF THE\nDAY",
              image: "assets/images/2moreOn.png",
              imageSize: 50,
            ),
            MoreCard(
              title: "NEW\nARRIVAL",
              image: "assets/images/1moreOn.png",
              imageSize: 70,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 30, child: Placeholder()),
        const SizedBox(height: 20),
        // Add _allCard items using ListView.builder instead of SliverList
        if (foodData.isNotEmpty) ...[
          const SectionHeader(title: "All Restaurants", onSeeAll: null),
          ListView.builder(
            shrinkWrap: true, // Important for Column compatibility
            physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling, let CustomScrollView handle it
            itemCount: AllRestaurant.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: CardWidget(data: AllRestaurant[index], cardType: 'all'),
            ),
          ),
        ],
      ],
    );
  }
}

class MoreCard extends StatelessWidget {
  final String title;
  final String image;
  final double imageSize;

  const MoreCard({
    super.key,
    required this.title,
    required this.image,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title.split('\n')[0] + '\n',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "poppins-bold",
                          ),
                        ),
                        TextSpan(
                          text: title.split('\n')[1],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: imageSize,
              width: imageSize,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final List<dynamic> bannerData;

  const Carousel({super.key, required this.bannerData});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.bannerData.map((url) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(url as String, fit: BoxFit.cover, width: double.infinity),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            scrollPhysics: const ClampingScrollPhysics(),
            height: 150,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) => setState(() => currentIndex = index),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannerData.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => currentIndex = entry.key),
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
    );
  }
}

class Grocery extends StatelessWidget {
  const Grocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Top Grocery Stores", onSeeAll: null),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    "Grocery Item ${index + 1}",
                    style: const TextStyle(fontSize: 16, fontFamily: "poppins-medium"),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green,
          child: const Center(
            child: Text(
              "Grocery Placeholder",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppins-bold",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Dineout extends StatelessWidget {
  const Dineout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Top Dineout Spots", onSeeAll: null),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    "Dineout Spot ${index + 1}",
                    style: const TextStyle(fontSize: 16, fontFamily: "poppins-medium"),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.blue,
          child: const Center(
            child: Text(
              "Dineout Placeholder",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppins-bold",
              ),
            ),
          ),
        ),
      ],
    );
  }
}