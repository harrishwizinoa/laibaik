import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../utils/themes.dart';
import '../../../widgets/cards/widgets.dart';
import 'customize.dart';

class Viewhotel extends StatefulWidget {
  final Map<String, dynamic> restaurantData;

  const Viewhotel({super.key, required this.restaurantData});

  @override
  State<Viewhotel> createState() => _ViewhotelState();
}

class _ViewhotelState extends State<Viewhotel> {
  bool _isRestaurantLiked = false;
  late List<Map<String, dynamic>> topViewData;
  final List<Map<String, String>> discountData = [
    {'price': '0.380', 'description': 'on selected items'},
    {'price': '0.500', 'description': 'on premium items'},
    {'price': '0.250', 'description': 'on combo meals'},
  ];
  final List<Map<String, dynamic>> recommendedData = [
    {
      'name': 'Tandoori Indian Chicken',
      'image': 'assets/images/china.png',
      'price': '0.254',
      'offer': 'Buy 2 Get 1 Free',
      'description': 'Roll made with flaky paratha, perfectly fried chicken strips',
      'rating': '4.6',
      'reviews': '220',
      'isVeg': false,
      'isBestSeller': true,
      'isLiked': false,
      'customize': true, // Can be customized
    },
    {
      'name': 'Vegetable Biryani',
      'image': 'assets/images/china.png',
      'price': '0.180',
      'offer': '10% off',
      'description': 'Aromatic rice with mixed vegetables and spices',
      'rating': '4.2',
      'reviews': '150',
      'isVeg': true,
      'isBestSeller': false,
      'isLiked': false,
      'customize': false, // Cannot be customized
    },
    {
      'name': 'Paneer Tikka',
      'image': 'assets/images/china.png',
      'price': '0.220',
      'offer': '15% off',
      'description': 'Grilled paneer cubes with spicy marinade',
      'rating': '4.8',
      'reviews': '300',
      'isVeg': true,
      'isBestSeller': true,
      'isLiked': false,
      'customize': true, // Can be customized
    },
  ];
  int _currentCarouselIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    final data = widget.restaurantData;
    topViewData = [
      {
        'image': 'assets/images/china.png',
        'name': 'Spicy Noodles',
        'discount': '20% off',
        'maxDiscount': 'OMR 0.500',
        'isLiked': false,
      },
      {
        'image': 'assets/images/china.png',
        'name': 'Grilled Chicken',
        'discount': '15% off',
        'maxDiscount': 'OMR 0.300',
        'isLiked': false,
      },
      {
        'image': 'assets/images/china.png',
        'name': 'Veggie Pizza',
        'discount': '10% off',
        'maxDiscount': 'OMR 0.200',
        'isLiked': false,
      },
      {
        'image': 'assets/images/china.png',
        'name': 'Butter Chicken',
        'discount': '25% off',
        'maxDiscount': 'OMR 0.600',
        'isLiked': false,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.restaurantData;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.09),
                      bottomRight: Radius.circular(screenWidth * 0.09),
                    ),
                  ),
                ),
                Positioned(
                  top: mediaQuery.padding.top + screenHeight * 0.02,
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.025),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              Icon(
                                Icons.person_add_alt_1,
                                color: Colors.white,
                                size: screenWidth * 0.035,
                              ),
                              const Spacer(),
                              Text(
                                "Group Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.025,
                                  fontFamily: "poppins",
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: screenWidth * 0.06,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  child: Container(
                    height: screenHeight * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.03,
                                top: screenHeight * 0.015,
                              ),
                              child: Container(
                                height: screenHeight * 0.1,
                                width: screenHeight * 0.1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        data['logo'] ?? data['image'] ?? "assets/images/china.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data['name'] ?? "Unknown Hotel",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.045,
                                            fontFamily: "poppins-bold",
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isRestaurantLiked = !_isRestaurantLiked;
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                _isRestaurantLiked
                                                    ? "assets/icons/nonlike.svg"
                                                    : "assets/icons/like.svg",
                                                width: screenWidth * 0.05,
                                                height: screenWidth * 0.05,
                                              ),
                                            ),
                                            SizedBox(width: screenWidth * 0.012),
                                            Image.asset(
                                              "assets/icons/info.png",
                                              width: screenWidth * 0.04,
                                              height: screenWidth * 0.04,
                                            ),
                                            SizedBox(width: screenWidth * 0.012),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      data['cuisine'] ?? "N/A",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          _getStarIcon(
                                              double.tryParse(data['rating']?.toString() ?? '0.0') ?? 0.0),
                                          width: screenWidth * 0.05,
                                          height: screenWidth * 0.05,
                                        ),
                                        SizedBox(width: screenWidth * 0.012),
                                        Text(
                                          data['rating']?.toString() ?? "N/A",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            fontFamily: "poppins-bold",
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.012),
                                        Text(
                                          "See ${data['reviews'] ?? 0} Reviews",
                                          style: TextStyle(
                                            fontFamily: "poppins",
                                            color: Colors.green,
                                            fontSize: screenWidth * 0.03,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.012),
                        Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/icons/clock.svg",
                              width: screenWidth * 0.04,
                              height: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.005),
                            Text(
                              data['time'] ?? "20-30 mins",
                              style: TextStyle(
                                fontFamily: "poppins-bold",
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 2,
                              height: screenHeight * 0.04,
                              color: const Color(0XFFF1F0F5),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/icons/delivary.svg",
                              width: screenWidth * 0.04,
                              height: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.005),
                            Text(
                              data['freeDelivery'] == true
                                  ? "Free Delivery"
                                  : "OMR ${data['deliveryPrice'] ?? '0.3584'}",
                              style: TextStyle(
                                fontFamily: "poppins-bold",
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 2,
                              height: screenHeight * 0.04,
                              color: const Color(0XFFF1F0F5),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "Delivered By",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontFamily: "poppins-medium",
                                  ),
                                ),
                                Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                      ),
                                      child: Text(
                                        'Labbaik',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.005),
                                    Image.asset(
                                      "assets/icons/info.png",
                                      width: screenWidth * 0.035,
                                      height: screenWidth * 0.035,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Container(
                            height: screenHeight * 0.05,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xFFFEE4E5),
                                  Color.fromRGBO(254, 228, 229, 0.5),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: ShaderMask(
                                shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Genie ",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "Extra ${data['discount'] ?? '10%'} off above OMR ${data['minOrder'] ?? 400}",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          fontFamily: "poppins-medium",
                                        ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.025,
                  left: screenWidth * 0.05,
                  child: Row(
                    children: [
                    Container(
                    height: screenHeight * 0.06,
                    width: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.15),),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.15),
                            gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFFFEE4E5),
                                Color.fromRGBO(254, 228, 229, 0.5),
                              ],
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/icons/bell.svg"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.012),
                    Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.15),
                            gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFFFEE4E5),
                                Color.fromRGBO(254, 228, 229, 0.5),
                              ],
                            ),
                          ),
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                              blendMode: BlendMode.srcIn,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Active ",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontFamily: "poppins-bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Genie Subscription",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontFamily: "poppins-medium",
                                      ),
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
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
            SizedBox(height: screenHeight * 0.012),
            // Carousel Section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * 0.08,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarouselIndex = index;
                        });
                      },
                    ),
                    items: discountData.map((discount) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          border: Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: screenWidth * 0.025),
                                SvgPicture.asset(
                                  "assets/icons/discount.svg",
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.05,
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Items at OMR ${discount['price']}\n",
                                        style: TextStyle(
                                          fontFamily: "poppins-bold",
                                          fontSize: screenWidth * 0.035,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: discount['description'],
                                        style: TextStyle(
                                          fontFamily: "poppins-medium",
                                          fontSize: screenWidth * 0.03,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(screenWidth * 0.02),
                                      child: Text(
                                        "${_currentCarouselIndex + 1}/${discountData.length}",
                                        style: TextStyle(fontSize: screenWidth * 0.03),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: discountData.asMap().entries.map((entry) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Assuming you have access to the CarouselController
                                            //_carouselController.jumpToPage(entry.key);
                                          },
                                          child: Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _currentCarouselIndex == entry.key
                                                  ? Colors.red
                                                  : Colors.grey.shade400,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for Dishes",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 24.0,
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 1.0,
                          height: 20.0,
                          color: Colors.grey.shade400,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.red,
                          size: 24.0,
                        ),
                      ],
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                  ),
                ),
              ),
            ),
            SectionHeader(title: 'Top Views', onSeeAll: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: topViewData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.032,
                      top: screenHeight * 0.01,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(screenWidth * 0.05),
                                bottomRight: Radius.circular(screenWidth * 0.05),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.9),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.012,
                          right: screenWidth * 0.021,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                topViewData[index]['isLiked'] = !item['isLiked'];
                              });
                            },
                            child: SvgPicture.asset(
                              item['isLiked'] ? "assets/icons/like.svg" : "assets/icons/nonlike.svg",
                              height: screenHeight * 0.03,
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.045,
                          bottom: screenHeight * 0.02,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${item['discount']}\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white,
                                    fontFamily: "poppins-bold",
                                  ),
                                ),
                                TextSpan(
                                  text: item['maxDiscount'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.027,
                                    color: const Color(0xFFDEDEDE),
                                    fontFamily: "poppins-medium",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: screenHeight * 0.02,
                          right: screenWidth * 0.03,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenWidth * 0.025),
                              gradient: AppColors.primaryGradient,
                            ),
                            child: Center(
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                  fontFamily: "poppins-bold",
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                children: [
                  SectionHeader(
                    title: "Recommended (${recommendedData.length})",
                    onSeeAll: () {},
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recommendedData.length,
                    itemBuilder: (context, index) {
                      final item = recommendedData[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          item['isVeg']
                                              ? 'assets/icons/vegdot.svg'
                                              : 'assets/icons/nonvegsymbol.svg',
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(width: 4),
                                        if (item['isBestSeller'])
                                          SvgPicture.asset(
                                            'assets/icons/bestseller.svg',
                                            height: 20,
                                            width: 20,
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontFamily: "poppins-bold",
                                        fontSize: 18,
                                      ),
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) =>
                                          AppColors.primaryGradient.createShader(
                                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                          ),
                                      child: Text(
                                        'OMR ${item['price']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) =>
                                          AppColors.primaryGradient.createShader(
                                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                          ),
                                      child: Text(
                                        item['offer'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.032,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins-semibold",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      item['description'],
                                      style: const TextStyle(
                                        fontFamily: "poppins-semibold",
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(4)),
                                            color: Color(0xFF00602B),
                                          ),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text(
                                                  item['rating'],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "poppins-bold",
                                                    fontSize: 10
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "{${item['reviews']}}",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, -1),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 160,
                                      width: 150,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(screenWidth * 0.08),
                                              image: DecorationImage(
                                                image: AssetImage(item['image']),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 15,
                                            right: 15,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  recommendedData[index]['isLiked'] =
                                                  !item['isLiked'];
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                item['isLiked']
                                                    ? "assets/icons/like.svg"
                                                    : "assets/icons/nonlike.svg",
                                                height: screenHeight * 0.021,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -8,
                                            left: 30,
                                            child: Container(
                                              height: 30,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(screenWidth * 0.025),
                                                gradient: AppColors.primaryGradient,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 25),
                                                  Center(
                                                    child: Text(
                                                      "ADD",
                                                      style: TextStyle(
                                                        fontFamily: "poppins-bold",
                                                        color: Colors.white,
                                                        fontSize: screenWidth * 0.042,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 8.0, top: 6, right: 8),
                                                      child: SvgPicture.asset(
                                                          "assets/icons/plus.svg"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:recommendedData[index]['customize'] == true ,
                                      child: TextButton(onPressed: (){
                                        Get.to(Customize(),
                                        transition: Transition.downToUp);
                                        print("hiii");}, child: Text("customize")),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStarIcon(double rating) {
    if (rating >= 0.0 && rating <= 1.9) return 'assets/icons/0star.svg';
    if (rating >= 2.0 && rating <= 2.4) return 'assets/icons/1star.svg';
    if (rating >= 2.5 && rating <= 2.9) return 'assets/icons/2star.svg';
    if (rating >= 3.0 && rating <= 3.4) return 'assets/icons/3star.svg';
    if (rating >= 3.5 && rating <= 3.9) return 'assets/icons/4star.svg';
    if (rating >= 4.0 && rating <= 5.0) return 'assets/icons/5star.svg';
    return 'assets/icons/0star.svg';
  }
}
