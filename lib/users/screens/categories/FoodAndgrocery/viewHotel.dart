import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/themes.dart';
import '../../../widgets/cards/widgets.dart';

class Viewhotel extends StatefulWidget {
  final Map<String, dynamic> restaurantData; // Accept restaurant data

  const Viewhotel({super.key, required this.restaurantData});

  @override
  State<Viewhotel> createState() => _ViewhotelState();
}

class _ViewhotelState extends State<Viewhotel> {
  @override
  Widget build(BuildContext context) {
    final data = widget.restaurantData;
    // Sample top view data (replace with actual menu items or featured dishes if available)
    List<Map<String, dynamic>> topViewData = (data['menuItems'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [
      {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 1', 'discount': 'No discount', 'maxDiscount': 'N/A'},
      {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 2', 'discount': 'No discount', 'maxDiscount': 'N/A'},
      {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 3', 'discount': 'No discount', 'maxDiscount': 'N/A'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              const Icon(
                                Icons.person_add_alt_1,
                                color: Colors.white,
                                size: 14,
                              ),
                              const Spacer(),
                              const Text(
                                "Group Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: "poppins",
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 12,
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data['logo'] ?? data['image'] ?? "assets/images/china.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data['name'] ?? "Unknown Hotel",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      const SizedBox(width: 50),
                                      SvgPicture.asset(
                                        "assets/icons/like.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Image.asset("assets/icons/info.png"),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    data['cuisine'] ?? "N/A",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        _getStarIcon(double.tryParse(data['rating']?.toString() ?? '0.0') ?? 0.0),
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        data['rating']?.toString() ?? "N/A",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "See ${data['reviews'] ?? 0} Reviews",
                                        style: const TextStyle(
                                          fontFamily: "poppins",
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset("assets/icons/clock.svg"),
                            const SizedBox(width: 2),
                            Text(
                              data['time'] ?? "20-30 mins",
                              style: const TextStyle(fontFamily: "poppins-bold"),
                            ),
                            const Spacer(),
                            Container(
                              width: 2,
                              height: 30,
                              color: const Color(0XFFF1F0F5),
                            ),
                            const Spacer(),
                            SvgPicture.asset("assets/icons/delivary.svg"),
                            const SizedBox(width: 2),
                            Text(
                              data['freeDelivery'] == true ? "Free Delivery" : "OMR ${data['deliveryPrice'] ?? '0.3584'}",
                              style: const TextStyle(fontFamily: "poppins-bold"),
                            ),
                            const Spacer(),
                            Container(
                              width: 2,
                              height: 30,
                              color: const Color(0XFFF1F0F5),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Text(
                                  "Delivered By",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "poppins-medium",
                                  ),
                                ),
                                Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                      ),
                                      child: const Text(
                                        'Labbaik',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Image.asset(
                                      "assets/icons/info.png",
                                      width: 15,
                                      height: 15,
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
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 40,
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
                                      const TextSpan(
                                        text: "Genie ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Extra ${data['discount'] ?? '10%'} off above OMR ${data['minOrder'] ?? 400} + ${data['freeDelivery'] == true ? 'Free Delivery' : 'Standard Delivery'}",
                                        style: const TextStyle(
                                          fontSize: 12,
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
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
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
                      const SizedBox(width: 5),
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
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
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Active ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "poppins-bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Genie Subscription",
                                        style: TextStyle(
                                          fontSize: 12,
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/discount.svg",
                      height: 40,
                      width: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Items at OMR ${data['itemPrice'] ?? '0.380'}\n",
                            style: const TextStyle(
                              fontFamily: "poppins-bold",
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: "on selected items",
                            style: TextStyle(
                              fontFamily: "poppins-medium",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [Text("1/3")]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search for dishes",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic, color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SectionHeader(title: 'Top Views', onSeeAll: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: topViewData.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Stack(
                      children: [
                        Container(
                          height: 240,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(item['image'] ?? "assets/images/china.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
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
                          top: 10,
                          right: 10,
                          child: SvgPicture.asset(
                            "assets/icons/nonlike.svg",
                            height: 40,
                          ),
                        ),
                        Positioned(
                          left: 14,
                          bottom: 10,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${item['discount'] ?? 'No discount'}\n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "poppins-bold",
                                  ),
                                ),
                                TextSpan(
                                  text: item['maxDiscount'] ?? 'N/A',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: Color(0xFFDEDEDE),
                                    fontFamily: "poppins-medium",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: AppColors.primaryGradient,
                            ),
                            child: const Center(
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                  fontFamily: "poppins-bold",
                                  color: Colors.white,
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
