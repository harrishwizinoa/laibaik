// import 'dart:ui';
// import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:laibaik/apiservice.dart';
// import 'package:laibaik/users/widgets/curve_Edge.dart';
// import 'package:laibaik/utils/themes.dart';
//
// import '../../../main.dart';
//
// ApiService apiService = ApiService();
//
// class FoodAndGrocery extends StatefulWidget {
//   const FoodAndGrocery({super.key});
//
//   @override
//   State<FoodAndGrocery> createState() => _FoodAndGroceryState();
// }
//
// class _FoodAndGroceryState extends State<FoodAndGrocery> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       fetch();
//     });
//   }
//   var foodData = [];
//   var mindData = [];
//   var bannerData = [];
//
//   void fetch() async {
//     vController.isLoading.value = true;
//     print("init: ${vController.isLoading.value}");
//     try {
//       var data = await apiService.data();
//       setState(() {
//         foodData = data['foodData'];
//         mindData = data['mindData'] ?? [];
//         bannerData = data['bannerData'] ?? [];
//       });
//     }
//     finally {
//       vController.isLoading.value = false;
//       print("finally: ${vController.isLoading.value}");
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF5F5F5),
//       body: CustomScrollView(
//         slivers: [
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: StickyHeaderDelegate(),
//           ),
//           SliverToBoxAdapter(child: Column(children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: MyTab( data: foodData, mindData: mindData,bannerData: bannerData,),
//             )])),
//         ],
//       ),
//     );
//   }
// }
//
// class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight = 135;
//   final double maxHeight = 320;
//
//   @override
//   double get minExtent => minHeight;
//
//   @override
//   double get maxExtent => maxHeight;
//
//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
//     final double titleFontSize = lerpDouble(22, 16, progress)!;
//     final double subtitleFontSize = lerpDouble(14, 10, progress)!;
//     final double searchBarHeight = lerpDouble(50, 40, progress)!;
//     final double paddingTop = lerpDouble(40, 10, progress)!;
//     final double spacing = lerpDouble(16, 8, progress)!;
//
//     return CurveEdge(
//       child: Container(
//         decoration: BoxDecoration(gradient: AppColors.primaryGradient),
//         child: Padding(
//           padding: EdgeInsets.only(top: paddingTop, left: 16, right: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_pin,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "Home",
//                             style: TextStyle(
//                               fontSize: titleFontSize,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "B 101, Muscat Oman",
//                         style: TextStyle(
//                           fontSize: subtitleFontSize,
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           "Genie",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.person_outline,
//                           color: Colors.green,
//                           size: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: spacing),
//               Container(
//                 height: searchBarHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search for iPhone',
//                     prefixIcon: Icon(Icons.search, color: Colors.red),
//                     suffixIcon: Icon(Icons.mic_rounded, color: Colors.red),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) => false;
// }
//
// class MyTab extends StatefulWidget {
//   List<dynamic> data;
//   final List<dynamic> mindData;
//   final List<dynamic> bannerData;
//   MyTab({super.key,required this.data,    required this.mindData,
//     required this.bannerData,});
//
//   @override
//   State<MyTab> createState() => _MyTabState();
// }
//
// class _MyTabState extends State<MyTab> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: SegmentedTabControl(
//                   indicatorPadding: const EdgeInsets.all(4),
//                   tabPadding: const EdgeInsets.all(14),
//                   squeezeIntensity: 3,
//                   backgroundColor: Color(0xffF1F0F5),
//                   indicatorColor: Colors.white,
//                   selectedTabTextColor: Colors.red,
//                   textStyle: TextStyle(fontWeight: FontWeight.bold,fontFamily: "poppins-medium"),
//                   tabTextColor: Colors.black87,
//                   height: 50,
//                   tabs: [
//                     SegmentTab(label: 'Food'),
//                     SegmentTab(label: 'Grocery'),
//                     SegmentTab(label: 'Dineout'),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: TabBarView(children: [Food(foodData: widget.data, mindData: widget.mindData, bannerData: widget.bannerData,), Container(), Container()]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Food extends StatefulWidget {
//   List<dynamic> foodData;
//   final List<dynamic> mindData;
//   final List<dynamic> bannerData;
//   Food({super.key,required this.foodData,required this.mindData,
//     required this.bannerData});
//
//   @override
//   State<Food> createState() => _FoodState();
// }
//
// class _FoodState extends State<Food> {
//
//   bool _isLiked = false;
//
//   int currentIndex = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Top Most Restaurant",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "poppins-semibold",
//                   ),
//                 ),
//                 ShaderMask(
//                   shaderCallback:
//                       (bounds) => AppColors.primaryGradient.createShader(
//                         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                       ),
//                   child: Text(
//                     'See All',
//                     style: TextStyle(
//                       color: Colors.white, // This is overridden by shader
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "poppins-bold",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 220, // Fixed height for restaurant ListView
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.foodData.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: _buildFoodCard(widget.foodData[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "What Your Mind ?",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "poppins-semibold",
//                   ),
//                 ),
//                 ShaderMask(
//                   shaderCallback:
//                       (bounds) => AppColors.primaryGradient.createShader(
//                         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                       ),
//                   child: Text(
//                     'See All',
//                     style: TextStyle(
//                       color: Colors.white, // This is overridden by shader
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "poppins-bold",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 120, // Fixed height for mind ListView
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.mindData.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: _buildMindCard(widget.mindData[index]),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 16),
//           carousel(),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               "More on labbaik",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "poppins-semibold",
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         border: Border.all(color: Colors.red, width: 2),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "OFFER\n",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                       fontFamily: "poppins-bold",
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "ZONE",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black,
//                                       fontFamily: "poppins",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 70,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/3moreOn.png"),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         border: Border.all(color: Colors.red, width: 2),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "DEAL OF THE\n",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                       fontFamily: "poppins-bold",
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "DAY",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black,
//                                       fontFamily: "poppins",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/2moreOn.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         border: Border.all(color: Colors.red, width: 2),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "NEW\n",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                       fontFamily: "poppins-bold",
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "ARRIVAL",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black,
//                                       fontFamily: "poppins",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 70,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/1moreOn.png"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20,),
//           SizedBox(height: 30,child: Placeholder(),),
//           SizedBox(height: 20,),
//           Container(
//             height: 100,
//             width: double.infinity,
//             color: Colors.red,
//           )
//         ],
//       );
//   }
//
//   Widget _buildMindCard(Map<String, dynamic> data) {
//     return Container(
//       width: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(100))
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 70,
//             width: 70,
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(data['image']),),
//           ),
//
//           SizedBox(height: 8),
//           Text(
//             data["name"],
//             style: TextStyle(
//               fontFamily: "poppins-semibold",
//               color: Color(0xff424242),
//               fontSize: 14,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFoodCard(Map<String, dynamic> data) {
//     double rating = double.tryParse(data["rating"]) ?? 0.0;
//
//     String starIcon;
//     if (rating >= 0.0 && rating <= 1.9) {
//       starIcon = 'assets/icons/0star.svg';
//     } else if (rating >= 2.0 && rating <= 2.4) {
//       starIcon = 'assets/icons/1star.svg';
//     } else if (rating >= 2.5 && rating <= 2.9) {
//       starIcon = 'assets/icons/2star.svg';
//     } else if (rating >= 3.0 && rating <= 3.4) {
//       starIcon = 'assets/icons/3star.svg';
//     } else if (rating >= 3.5 && rating <= 3.9) {
//       starIcon = 'assets/icons/4star.svg';
//     } else if (rating >= 4.0 && rating <= 5.0) {
//       starIcon = 'assets/icons/5star.svg';
//     } else {
//       starIcon = 'assets/icons/0star.svg';
//     }
//
//     return Container(
//       height: 200,
//       width: 150,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 120,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     image: NetworkImage(data["image"]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: GestureDetector(
//                   onTap: () {
//                     print("ji");
//                     setState(() {
//                       _isLiked = !_isLiked;
//                     });
//                   },
//                   child: SvgPicture.asset(
//                     _isLiked
//                         ? "assets/icons/like.svg"
//                         : "assets/icons/nonlike1.svg",
//                     height: 18,
//                     width: 18,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 14,
//                 bottom: 10,
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "${data["discount"]}\n",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.white,
//                           fontFamily: "poppins-bold",
//                         ),
//                       ),
//                       TextSpan(
//                         text: data["maxDiscount"],
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 9,
//                           color: Color(0xFFDEDEDE),
//                           fontFamily: "poppins-medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0, top: 8),
//             child: Text(
//               data["name"],
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//                 fontFamily: "poppins-bold",
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   starIcon, // Use dynamic star icon
//                   height: 12,
//                   width: 12,
//                 ),
//                 SizedBox(width: 2),
//                 Text(
//                   data["rating"],
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 SvgPicture.asset(
//                   'assets/icons/clock.svg',
//                   height: 12,
//                   width: 12,
//                 ),
//                 SizedBox(width: 2),
//                 Text(
//                   data["time"],
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0),
//             child: Text(
//               data["cuisine"],
//               style: TextStyle(
//                 color: Color(0xff6E6F71),
//                 fontWeight: FontWeight.w200,
//                 fontSize: 12,
//                 fontFamily: "poppins",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget carousel() {
//     return Stack(
//       children: [
//         CarouselSlider(
//           items: widget.bannerData.map((url) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       url,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ),
//                   ),
//                 );
//               }).toList(),
//           options: CarouselOptions(
//             scrollPhysics: const AlwaysScrollableScrollPhysics(),
//             height: 150,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             enlargeCenterPage: false,
//             viewportFraction: 0.9,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 10,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:
//                 widget.bannerData.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap:
//                         () => setState(() {
//                           currentIndex = entry.key;
//                         }),
//                     child: Container(
//                       width: currentIndex == entry.key ? 18 : 6,
//                       height: 6,
//                       margin: const EdgeInsets.symmetric(horizontal: 3),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3),
//                         color:
//                             currentIndex == entry.key
//                                 ? Colors.white
//                                 : Colors.grey,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//


// import 'dart:ui';
// import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:laibaik/apiservice.dart';
// import 'package:laibaik/users/widgets/curve_Edge.dart';
// import 'package:laibaik/utils/themes.dart';
//
// import '../../../main.dart';
//
// ApiService apiService = ApiService();
//
// class FoodAndGrocery extends StatefulWidget {
//   const FoodAndGrocery({super.key});
//
//   @override
//   State<FoodAndGrocery> createState() => _FoodAndGroceryState();
// }
//
// class _FoodAndGroceryState extends State<FoodAndGrocery> with TickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       fetch();
//     });
//   }
//
//   var foodData = [];
//   var mindData = [];
//   var bannerData = [];
//
//   void fetch() async {
//     vController.isLoading.value = true;
//     print("init: ${vController.isLoading.value}");
//     try {
//       var data = await apiService.data();
//       setState(() {
//         foodData = data['foodData'];
//         mindData = data['mindData'] ?? [];
//         bannerData = data['bannerData'] ?? [];
//       });
//     } finally {
//       vController.isLoading.value = false;
//       print("finally: ${vController.isLoading.value}");
//     }
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F5F5),
//       body: CustomScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         slivers: [
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: StickyHeaderDelegate(),
//           ),
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: StickyTabBarDelegate(
//               tabController: _tabController,
//               data: foodData,
//               mindData: mindData,
//               bannerData: bannerData,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: AnimatedBuilder(
//               animation: _tabController,
//               builder: (context, _) {
//                 return [
//                   Food(
//                     foodData: foodData,
//                     mindData: mindData,
//                     bannerData: bannerData,
//                   ),
//                   const Grocery(),
//                   const Dineout(),
//                 ][_tabController.index];
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight = 135;
//   final double maxHeight = 320;
//
//   @override
//   double get minExtent => minHeight;
//
//   @override
//   double get maxExtent => maxHeight;
//
//   @override
//   Widget build(
//       BuildContext context,
//       double shrinkOffset,
//       bool overlapsContent,
//       ) {
//     final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
//     final double titleFontSize = lerpDouble(22, 16, progress)!;
//     final double subtitleFontSize = lerpDouble(14, 10, progress)!;
//     final double searchBarHeight = lerpDouble(50, 40, progress)!;
//     final double paddingTop = lerpDouble(40, 10, progress)!;
//     final double spacing = lerpDouble(16, 8, progress)!;
//
//     return CurveEdge(
//       child: Container(
//         decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
//         child: Padding(
//           padding: EdgeInsets.only(top: paddingTop, left: 16, right: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.location_pin,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             "Home",
//                             style: TextStyle(
//                               fontSize: titleFontSize,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         "B 101, Muscat Oman",
//                         style: TextStyle(
//                           fontSize: subtitleFontSize,
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Text(
//                           "Genie",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.person_outline,
//                           color: Colors.green,
//                           size: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: spacing),
//               Container(
//                 height: searchBarHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search for iPhone',
//                     prefixIcon: Icon(Icons.search, color: Colors.red),
//                     suffixIcon: Icon(Icons.mic_rounded, color: Colors.red),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) => false;
// }
//
// class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabController tabController;
//   final List<dynamic> data;
//   final List<dynamic> mindData;
//   final List<dynamic> bannerData;
//
//   StickyTabBarDelegate({
//     required this.tabController,
//     required this.data,
//     required this.mindData,
//     required this.bannerData,
//   });
//
//   @override
//   double get minExtent => 66;
//
//   @override
//   double get maxExtent => 66;
//
//   @override
//   Widget build(
//       BuildContext context,
//       double shrinkOffset,
//       bool overlapsContent,
//       ) {
//     return Container(
//       color: const Color(0xffF5F5F5),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Opacity(
//         opacity: 1.0,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: SegmentedTabControl(
//             controller: tabController,
//             indicatorPadding: const EdgeInsets.all(4),
//             tabPadding: const EdgeInsets.all(14),
//             squeezeIntensity: 3,
//             backgroundColor: const Color(0xffF1F0F5),
//             indicatorColor: Colors.white,
//             selectedTabTextColor: Colors.red,
//             textStyle: const TextStyle(
//                 fontWeight: FontWeight.bold, fontFamily: "poppins-medium"),
//             tabTextColor: Colors.black87,
//             height: 50,
//             tabs: const [
//               SegmentTab(label: 'Food'),
//               SegmentTab(label: 'Grocery'),
//               SegmentTab(label: 'Dineout'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   bool shouldRebuild(covariant StickyTabBarDelegate oldDelegate) {
//     return data != oldDelegate.data ||
//         mindData != oldDelegate.mindData ||
//         bannerData != oldDelegate.bannerData ||
//         tabController != oldDelegate.tabController;
//   }
// }
//
// class Food extends StatefulWidget {
//   final List<dynamic> foodData;
//   final List<dynamic> mindData;
//   final List<dynamic> bannerData;
//
//   const Food({
//     super.key,
//     required this.foodData,
//     required this.mindData,
//     required this.bannerData,
//   });
//
//   @override
//   State<Food> createState() => _FoodState();
// }
//
// class _FoodState extends State<Food> {
//   bool _isLiked = false;
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Top Most Restaurant",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "poppins-semibold",
//                 ),
//               ),
//               ShaderMask(
//                 shaderCallback: (bounds) =>
//                     AppColors.primaryGradient.createShader(
//                       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                     ),
//                 child: const Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.foodData.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: _buildFoodCard(widget.foodData[index]),
//               );
//             },
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "What Your Mind ?",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "poppins-semibold",
//                 ),
//               ),
//               ShaderMask(
//                 shaderCallback: (bounds) =>
//                     AppColors.primaryGradient.createShader(
//                       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                     ),
//                 child: const Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 120,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.mindData.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 child: _buildMindCard(widget.mindData[index]),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 16),
//         carousel(),
//         const Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Text(
//             "More on labbaik",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               fontFamily: "poppins-semibold",
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       border: Border.all(color: Colors.red, width: 2),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                          Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "OFFER\n",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                     fontFamily: "poppins-bold",
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "ZONE",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black,
//                                     fontFamily: "poppins",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       height: 70,
//                       width: 70,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/3moreOn.png"),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       border: Border.all(color: Colors.red, width: 2),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                          Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "DEAL OF THE\n",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                     fontFamily: "poppins-bold",
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "DAY",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black,
//                                     fontFamily: "poppins",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       height: 50,
//                       width: 50,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/2moreOn.png"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       border: Border.all(color: Colors.red, width: 2),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                          Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "NEW\n",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                     fontFamily: "poppins-bold",
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "ARRIVAL",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black,
//                                     fontFamily: "poppins",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       height: 70,
//                       width: 70,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/1moreOn.png"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         const SizedBox(height: 30, child: Placeholder()),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 800,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: widget.mindData.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 child: _allCard(widget.foodData[index]),
//               );
//             },
//           ),
//         ),
//
//       ],
//     );
//   }
//
//
//   Widget _allCard(Map<String, dynamic> data) {
//
//     double rating = double.tryParse(data["rating"]?.toString() ?? '0.0') ?? 0.0;
//
//     String starIcon;
//     if (rating >= 0.0 && rating <= 1.9) {
//       starIcon = 'assets/icons/0star.svg';
//     } else if (rating >= 2.0 && rating <= 2.4) {
//       starIcon = 'assets/icons/1star.svg';
//     } else if (rating >= 2.5 && rating <= 2.9) {
//       starIcon = 'assets/icons/2star.svg';
//     } else if (rating >= 3.0 && rating <= 3.4) {
//       starIcon = 'assets/icons/3star.svg';
//     } else if (rating >= 3.5 && rating <= 3.9) {
//       starIcon = 'assets/icons/4star.svg';
//     } else if (rating >= 4.0 && rating <= 5.0) {
//       starIcon = 'assets/icons/5star.svg';
//     } else {
//       starIcon = 'assets/icons/0star.svg';
//     }
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 130,
//         width: double.infinity,
//         clipBehavior: Clip.hardEdge, // Prevent overflow
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Stack(
//                 clipBehavior: Clip.none, // Allow positioned children to render outside
//                 children: [
//                   Container(
//                     height: 130,
//                     width: 180,
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/food.png"),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _isLiked = !_isLiked;
//                         });
//                       },
//                       child: SvgPicture.asset(
//                         _isLiked ? "assets/icons/like.svg" : "assets/icons/nonlike1.svg",
//                         height: 28,
//                         width: 18,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 14,
//                     bottom: 10,
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "${data["discount"] ?? 'No discount'}\n",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontFamily: "poppins-bold",
//                             ),
//                           ),
//                           TextSpan(
//                             text: data["maxDiscount"] ?? 'N/A',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                               color: Color(0xFFDEDEDE),
//                               fontFamily: "poppins-medium",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded( // Use Expanded to prevent overflow in the Column
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       data["name"] ?? 'Unknown',
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         fontFamily: "poppins-bold",
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           starIcon,
//                           height: 14,
//                           width: 14,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           "${data["rating"] ?? '0.0'}",
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             fontFamily: "poppins-bold",
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         SvgPicture.asset(
//                           'assets/icons/clock.svg',
//                           height: 16,
//                           width: 16,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           data["time"] ?? 'N/A',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             fontFamily: "poppins-bold",
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       data["cuisine"] ?? 'Unknown',
//                       style: const TextStyle(
//                         color: Color(0xff6E6F71),
//                         fontWeight: FontWeight.w200,
//                         fontSize: 12,
//                         fontFamily: "poppins",
//                       ),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/discount.svg',
//                           height: 14,
//                           width: 14,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           "Extra discount",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 10,
//                             fontFamily: "poppins",
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/delivary.svg',
//                           height: 16,
//                           width: 16,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           "Free delivery",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 10,
//                             fontFamily: "poppins",
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMindCard(Map<String, dynamic> data) {
//     return Container(
//       width: 100,
//       decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 70,
//             width: 70,
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(data['image']),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             data["name"],
//             style: const TextStyle(
//               fontFamily: "poppins-semibold",
//               color: Color(0xff424242),
//               fontSize: 14,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFoodCard(Map<String, dynamic> data) {
//     double rating = double.tryParse(data["rating"]) ?? 0.0;
//
//     String starIcon;
//     if (rating >= 0.0 && rating <= 1.9) {
//       starIcon = 'assets/icons/0star.svg';
//     } else if (rating >= 2.0 && rating <= 2.4) {
//       starIcon = 'assets/icons/1star.svg';
//     } else if (rating >= 2.5 && rating <= 2.9) {
//       starIcon = 'assets/icons/2star.svg';
//     } else if (rating >= 3.0 && rating <= 3.4) {
//       starIcon = 'assets/icons/3star.svg';
//     } else if (rating >= 3.5 && rating <= 3.9) {
//       starIcon = 'assets/icons/4star.svg';
//     } else if (rating >= 4.0 && rating <= 5.0) {
//       starIcon = 'assets/icons/5star.svg';
//     } else {
//       starIcon = 'assets/icons/0star.svg';
//     }
//
//     return Container(
//       height: 200,
//       width: 150,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 120,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     image: NetworkImage(data["image"]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: GestureDetector(
//                   onTap: () {
//                     print("ji");
//                     setState(() {
//                       _isLiked = !_isLiked;
//                     });
//                   },
//                   child: SvgPicture.asset(
//                     _isLiked
//                         ? "assets/icons/like.svg"
//                         : "assets/icons/nonlike1.svg",
//                     height: 18,
//                     width: 18,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 14,
//                 bottom: 10,
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "${data["discount"]}\n",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.white,
//                           fontFamily: "poppins-bold",
//                         ),
//                       ),
//                       TextSpan(
//                         text: data["maxDiscount"],
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 9,
//                           color: Color(0xFFDEDEDE),
//                           fontFamily: "poppins-medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0, top: 8),
//             child: Text(
//               data["name"],
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//                 fontFamily: "poppins-bold",
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   starIcon,
//                   height: 12,
//                   width: 12,
//                 ),
//                 const SizedBox(width: 2),
//                 Text(
//                   data["rating"],
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 SvgPicture.asset(
//                   'assets/icons/clock.svg',
//                   height: 12,
//                   width: 12,
//                 ),
//                 const SizedBox(width: 2),
//                 Text(
//                   data["time"],
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 4.0),
//             child: Text(
//               data["cuisine"],
//               style: const TextStyle(
//                 color: Color(0xff6E6F71),
//                 fontWeight: FontWeight.w200,
//                 fontSize: 12,
//                 fontFamily: "poppins",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget carousel() {
//     return Stack(
//       children: [
//         CarouselSlider(
//           items: widget.bannerData.map((url) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   url,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             );
//           }).toList(),
//           options: CarouselOptions(
//             scrollPhysics: const AlwaysScrollableScrollPhysics(),
//             height: 150,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             enlargeCenterPage: false,
//             viewportFraction: 0.9,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 10,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.bannerData.asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => setState(() {
//                   currentIndex = entry.key;
//                 }),
//                 child: Container(
//                   width: currentIndex == entry.key ? 18 : 6,
//                   height: 6,
//                   margin: const EdgeInsets.symmetric(horizontal: 3),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     color: currentIndex == entry.key ? Colors.white : Colors.grey,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Grocery extends StatelessWidget {
//   const Grocery({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Text(
//             "Top Grocery Stores",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               fontFamily: "poppins-semibold",
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Container(
//                   height: 200,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.grey.shade200,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Grocery Item ${index + 1}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontFamily: "poppins-medium",
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 20),
//         Container(
//           height: 100,
//           width: double.infinity,
//           color: Colors.green,
//           child: const Center(
//             child: Text(
//               "Grocery Placeholder",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontFamily: "poppins-bold",
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Dineout extends StatelessWidget {
//   const Dineout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Text(
//             "Top Dineout Spots",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               fontFamily: "poppins-semibold",
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Container(
//                   height: 200,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.grey.shade200,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Dineout Spot ${index + 1}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontFamily: "poppins-medium",
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 20),
//         Container(
//           height: 100,
//           width: double.infinity,
//           color: Colors.blue,
//           child: const Center(
//             child: Text(
//               "Dineout Placeholder",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontFamily: "poppins-bold",
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:ui';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laibaik/apiservice.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import 'package:laibaik/utils/themes.dart';

import '../../../main.dart';
import '../../widgets/cards/widgets.dart';

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
  final double minHeight = 135;
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
    final double paddingTop = lerpDouble(40, 10, progress)!;
    final double spacing = lerpDouble(16, 8, progress)!;

    return CurveEdge(
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
          borderRadius: BorderRadius.circular(20),
        ),
        child: SegmentedTabControl(
          controller: tabController,
          indicatorPadding: const EdgeInsets.all(4),
          tabPadding: const EdgeInsets.all(14),
          squeezeIntensity: 3,
          backgroundColor: const Color(0xffF1F0F5),
          indicatorColor: Colors.white,
          selectedTabTextColor: Colors.red,
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "poppins-medium"),
          tabTextColor: Colors.black87,
          height: 50,
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

// // Reusable Section Header Widget
// class SectionHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback? onSeeAll;
//
//   const SectionHeader({super.key, required this.title, this.onSeeAll});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               fontFamily: "poppins-semibold",
//             ),
//           ),
//           if (onSeeAll != null)
//             ShaderMask(
//               shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
//                 Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//               ),
//               child: GestureDetector(
//                 onTap: onSeeAll,
//                 child: const Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "poppins-bold",
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// // Reusable Card Widget
// class CardWidget extends StatefulWidget {
//   final Map<String, dynamic> data;
//   final String cardType; // 'food', 'mind', or 'all'
//   final double? width;
//   final double? height;
//
//   const CardWidget({
//     super.key,
//     required this.data,
//     required this.cardType,
//     this.width,
//     this.height,
//   });
//
//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }
//
// class _CardWidgetState extends State<CardWidget> {
//   bool _isLiked = false;
//
//   String _getStarIcon(double rating) {
//     if (rating >= 0.0 && rating <= 1.9) return 'assets/icons/0star.svg';
//     if (rating >= 2.0 && rating <= 2.4) return 'assets/icons/1star.svg';
//     if (rating >= 2.5 && rating <= 2.9) return 'assets/icons/2star.svg';
//     if (rating >= 3.0 && rating <= 3.4) return 'assets/icons/3star.svg';
//     if (rating >= 3.5 && rating <= 3.9) return 'assets/icons/4star.svg';
//     if (rating >= 4.0 && rating <= 5.0) return 'assets/icons/5star.svg';
//     return 'assets/icons/0star.svg';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.data.isEmpty) {
//       return const SizedBox.shrink();
//     }
//
//     final double rating = double.tryParse(widget.data['rating']?.toString() ?? '0.0') ?? 0.0;
//     final String starIcon = _getStarIcon(rating);
//
//     if (widget.cardType == 'mind') {
//       return Container(
//         width: widget.width ?? 100,
//         decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 70,
//               width: 70,
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(widget.data['image'] ?? ''),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.data['name'] ?? 'Unknown',
//               style: const TextStyle(
//                 fontFamily: "poppins-semibold",
//                 color: Color(0xff424242),
//                 fontSize: 14,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (widget.cardType == 'food') {
//       return Container(
//         height: widget.height ?? 200,
//         width: widget.width ?? 150,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 120,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: NetworkImage(widget.data['image'] ?? ''),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: GestureDetector(
//                     onTap: () => setState(() => _isLiked = !_isLiked),
//                     child: SvgPicture.asset(
//                       _isLiked ? 'assets/icons/like.svg' : 'assets/icons/nonlike1.svg',
//                       height: 22,
//                       width: 22,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 14,
//                   bottom: 10,
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "${widget.data['discount'] ?? 'No discount'}\n",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Colors.white,
//                             fontFamily: "poppins-bold",
//                           ),
//                         ),
//                         TextSpan(
//                           text: widget.data['maxDiscount'] ?? 'N/A',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 9,
//                             color: Color(0xFFDEDEDE),
//                             fontFamily: "poppins-medium",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 4.0, top: 8),
//               child: Text(
//                 widget.data['name'] ?? 'Unknown',
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   fontFamily: "poppins-bold",
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 4.0),
//               child: Row(
//                 children: [
//                   SvgPicture.asset(starIcon, height: 12, width: 12),
//                   const SizedBox(width: 2),
//                   Text(
//                     widget.data['rating']?.toString() ?? '0.0',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                       fontFamily: "poppins-bold",
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   SvgPicture.asset('assets/icons/clock.svg', height: 12, width: 12),
//                   const SizedBox(width: 2),
//                   Text(
//                     widget.data['time'] ?? 'N/A',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                       fontFamily: "poppins-bold",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 4.0),
//               child: Text(
//                 widget.data['cuisine'] ?? 'Unknown',
//                 style: const TextStyle(
//                   color: Color(0xff6E6F71),
//                   fontWeight: FontWeight.w200,
//                   fontSize: 12,
//                   fontFamily: "poppins",
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     // All Card
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Container(
//         height: widget.height ?? 130,
//         width: double.infinity,
//         clipBehavior: Clip.hardEdge,
//         decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     height: 130,
//                     width: 180,
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/food.png"),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 16,
//                     child: GestureDetector(
//                       onTap: () => setState(() => _isLiked = !_isLiked),
//                       child: SvgPicture.asset(
//                         _isLiked ? 'assets/icons/like.svg' : 'assets/icons/nonlike1.svg',
//                         height: 28,
//                         width: 18,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 14,
//                     bottom: 10,
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "${widget.data['discount'] ?? 'No discount'}\n",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontFamily: "poppins-bold",
//                             ),
//                           ),
//                           TextSpan(
//                             text: widget.data['maxDiscount'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                               color: Color(0xFFDEDEDE),
//                               fontFamily: "poppins-medium",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.data['name'] ?? 'Unknown',
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         fontFamily: "poppins-bold",
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Row(
//                       children: [
//                         SvgPicture.asset(starIcon, height: 14, width: 14),
//                         const SizedBox(width: 2),
//                         Text(
//                           widget.data['rating']?.toString() ?? '0.0',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             fontFamily: "poppins-bold",
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         SvgPicture.asset('assets/icons/clock.svg', height: 16, width: 16),
//                         const SizedBox(width: 2),
//                         Text(
//                           widget.data['time'] ?? 'N/A',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             fontFamily: "poppins-bold",
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       widget.data['cuisine'] ?? 'Unknown',
//                       style: const TextStyle(
//                         color: Color(0xff6E6F71),
//                         fontWeight: FontWeight.w200,
//                         fontSize: 12,
//                         fontFamily: "poppins",
//                       ),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     if (widget.data['extraDiscount'] == true)
//                       Row(
//                         children: [
//                           SvgPicture.asset('assets/icons/discount.svg', height: 14, width: 14),
//                           const SizedBox(width: 2),
//                           const Text(
//                             "Extra discount",
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, fontFamily: "poppins"),
//                           ),
//                         ],
//                       ),
//
//                     Row(
//                       children: [
//                         SvgPicture.asset('assets/icons/delivary.svg', height: 16, width: 16),
//                         const SizedBox(width: 2),
//                         Text(
//                           widget.data['freeDelivery'] == true
//                               ? "Free delivery"
//                               : "Delivery: ${widget.data['deliveryPrice'] ?? 'N/A'}",
//                           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, fontFamily: "poppins"),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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