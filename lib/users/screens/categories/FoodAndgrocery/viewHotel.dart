// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../utils/themes.dart';
// import '../../../widgets/cards/widgets.dart';
//
// class Viewhotel extends StatefulWidget {
//   final Map<String, dynamic> restaurantData; // Accept restaurant data
//
//   const Viewhotel({super.key, required this.restaurantData});
//
//   @override
//   State<Viewhotel> createState() => _ViewhotelState();
// }
//
// class _ViewhotelState extends State<Viewhotel> {
//   @override
//   Widget build(BuildContext context) {
//     final data = widget.restaurantData;
//     List<Map<String, dynamic>> topViewData = (data['menuItems'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [
//       {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 1', 'discount': 'No discount', 'maxDiscount': 'N/A'},
//       {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 2', 'discount': 'No discount', 'maxDiscount': 'N/A'},
//       {'image': data['image'] ?? "assets/images/china.png", 'name': 'Dish 3', 'discount': 'No discount', 'maxDiscount': 'N/A'},
//     ];
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 400,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: AppColors.primaryGradient,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(35),
//                       bottomRight: Radius.circular(35),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 50,
//                   left: 16,
//                   right: 16,
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const Spacer(),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           height: 40,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.white),
//                           ),
//                           child: Row(
//                             children: [
//                               const Spacer(),
//                               const Icon(
//                                 Icons.person_add_alt_1,
//                                 color: Colors.white,
//                                 size: 14,
//                               ),
//                               const Spacer(),
//                               const Text(
//                                 "Group Order",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                   fontFamily: "poppins",
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Icon(Icons.more_vert, color: Colors.white),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 110,
//                   left: 16,
//                   right: 16,
//                   child: Container(
//                     height: 200,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 12.0,
//                                 top: 12,
//                               ),
//                               child: Container(
//                                 height: 80,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(data['logo'] ?? data['image'] ?? "assets/images/china.png"),
//                                     fit: BoxFit.cover,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         data['name'] ?? "Unknown Hotel",
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       const SizedBox(width: 50),
//                                       SvgPicture.asset(
//                                         "assets/icons/like.svg",
//                                         width: 20,
//                                         height: 20,
//                                       ),
//                                       const SizedBox(width: 5),
//                                       Image.asset("assets/icons/info.png"),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     data['cuisine'] ?? "N/A",
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontFamily: "poppins",
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         _getStarIcon(double.tryParse(data['rating']?.toString() ?? '0.0') ?? 0.0),
//                                         width: 20,
//                                         height: 20,
//                                       ),
//                                       const SizedBox(width: 5),
//                                       Text(
//                                         data['rating']?.toString() ?? "N/A",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       const SizedBox(width: 5),
//                                       Text(
//                                         "See ${data['reviews'] ?? 0} Reviews",
//                                         style: const TextStyle(
//                                           fontFamily: "poppins",
//                                           color: Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             const Spacer(),
//                             SvgPicture.asset("assets/icons/clock.svg"),
//                             const SizedBox(width: 2),
//                             Text(
//                               data['time'] ?? "20-30 mins",
//                               style: const TextStyle(fontFamily: "poppins-bold"),
//                             ),
//                             const Spacer(),
//                             Container(
//                               width: 2,
//                               height: 30,
//                               color: const Color(0XFFF1F0F5),
//                             ),
//                             const Spacer(),
//                             SvgPicture.asset("assets/icons/delivary.svg"),
//                             const SizedBox(width: 2),
//                             Text(
//                               data['freeDelivery'] == true ? "Free Delivery" : "OMR ${data['deliveryPrice'] ?? '0.3584'}",
//                               style: const TextStyle(fontFamily: "poppins-bold"),
//                             ),
//                             const Spacer(),
//                             Container(
//                               width: 2,
//                               height: 30,
//                               color: const Color(0XFFF1F0F5),
//                             ),
//                             const Spacer(),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "Delivered By",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontFamily: "poppins-medium",
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     ShaderMask(
//                                       shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
//                                         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                                       ),
//                                       child: const Text(
//                                         'Labbaik',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 2),
//                                     Image.asset(
//                                       "assets/icons/info.png",
//                                       width: 15,
//                                       height: 15,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                         const Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             height: 40,
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(20),
//                                 bottomLeft: Radius.circular(20),
//                               ),
//                             ),
//                             child: Center(
//                               child: ShaderMask(
//                                 shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
//                                 blendMode: BlendMode.srcIn,
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       const TextSpan(
//                                         text: "Genie ",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: "Extra ${data['discount'] ?? '10%'} off above OMR ${data['minOrder'] ?? 400} ",
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           fontFamily: "poppins-medium",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               gradient: const LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                             ),
//                             child: Center(
//                               child: SvgPicture.asset("assets/icons/bell.svg"),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       Container(
//                         height: 50,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               gradient: const LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                             ),
//                             child: Center(
//                               child: ShaderMask(
//                                 shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
//                                 blendMode: BlendMode.srcIn,
//                                 child: RichText(
//                                   text: const TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "Active ",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: "Genie Subscription",
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontFamily: "poppins-medium",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 70,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.grey.shade300, width: 1),
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 10),
//                     SvgPicture.asset(
//                       "assets/icons/discount.svg",
//                       height: 40,
//                       width: 20,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Items at OMR ${data['itemPrice'] ?? '0.380'}\n",
//                             style: const TextStyle(
//                               fontFamily: "poppins-bold",
//                               fontSize: 14,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const TextSpan(
//                             text: "on selected items",
//                             style: TextStyle(
//                               fontFamily: "poppins-medium",
//                               fontSize: 12,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Spacer(),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(children: [Text("1/3")]),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "search for dishes",
//                     prefixIcon: const Icon(Icons.search),
//                     suffixIcon: const Icon(Icons.mic, color: Colors.red),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SectionHeader(title: 'Top Views', onSeeAll: () {}),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: topViewData.map((item) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 8, top: 8),
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: 240,
//                           width: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: DecorationImage(
//                               image: NetworkImage(item['image'] ?? "assets/images/china.png"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 100,
//                             width: 200,
//                             decoration: BoxDecoration(
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20),
//                               ),
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.transparent,
//                                   Colors.black.withOpacity(0.9),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: SvgPicture.asset(
//                             "assets/icons/nonlike.svg",
//                             height: 40,
//                           ),
//                         ),
//                         Positioned(
//                           left: 14,
//                           bottom: 10,
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "${item['discount'] ?? 'No discount'}\n",
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontFamily: "poppins-bold",
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: item['maxDiscount'] ?? 'N/A',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 11,
//                                     color: Color(0xFFDEDEDE),
//                                     fontFamily: "poppins-medium",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 10,
//                           right: 10,
//                           child: Container(
//                             height: 30,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: AppColors.primaryGradient,
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 "ADD",
//                                 style: TextStyle(
//                                   fontFamily: "poppins-bold",
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
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
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../utils/themes.dart';
// import '../../../widgets/cards/widgets.dart';
//
// class Viewhotel extends StatefulWidget {
//   final Map<String, dynamic> restaurantData;
//
//   const Viewhotel({super.key, required this.restaurantData});
//
//   @override
//   State<Viewhotel> createState() => _ViewhotelState();
// }
//
// class _ViewhotelState extends State<Viewhotel> {
//   bool _isRestaurantLiked = false; // State for restaurant like button
//   late List<Map<String, dynamic>> topViewData;
//
//   @override
//   void initState() {
//     super.initState();
//     final data = widget.restaurantData;
//     topViewData = (data['menuItems'] as List<dynamic>?)
//         ?.cast<Map<String, dynamic>>()
//         .map((item) => {...item, 'isLiked': false})
//         .toList() ??
//         [
//           {
//             'image': data['image'] ?? "assets/images/china.png",
//             'name': 'Dish 1',
//             'discount': 'No discount',
//             'maxDiscount': 'N/A',
//             'isLiked': false,
//           },
//           {
//             'image': data['image'] ?? "assets/images/china.png",
//             'name': 'Dish 2',
//             'discount': 'No discount',
//             'maxDiscount': 'N/A',
//             'isLiked': false,
//           },
//           {
//             'image': data['image'] ?? "assets/images/china.png",
//             'name': 'Dish 3',
//             'discount': 'No discount',
//             'maxDiscount': 'N/A',
//             'isLiked': false,
//           },
//         ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = widget.restaurantData;
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: screenHeight * 0.5,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: AppColors.primaryGradient,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(screenWidth * 0.09),
//                       bottomRight: Radius.circular(screenWidth * 0.09),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: mediaQuery.padding.top + screenHeight * 0.02,
//                   left: screenWidth * 0.04,
//                   right: screenWidth * 0.04,
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                           size: screenWidth * 0.06,
//                         ),
//                       ),
//                       const Spacer(),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           height: screenHeight * 0.05,
//                           width: screenWidth * 0.25,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                             border: Border.all(color: Colors.white),
//                           ),
//                           child: Row(
//                             children: [
//                               const Spacer(),
//                               Icon(
//                                 Icons.person_add_alt_1,
//                                 color: Colors.white,
//                                 size: screenWidth * 0.035,
//                               ),
//                               const Spacer(),
//                               Text(
//                                 "Group Order",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: screenWidth * 0.025,
//                                   fontFamily: "poppins",
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.025),
//                       Icon(
//                         Icons.more_vert,
//                         color: Colors.white,
//                         size: screenWidth * 0.06,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: screenHeight * 0.15,
//                   left: screenWidth * 0.04,
//                   right: screenWidth * 0.04,
//                   child: Container(
//                     height: screenHeight * 0.25,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(screenWidth * 0.05),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: screenWidth * 0.03,
//                                 top: screenHeight * 0.015,
//                               ),
//                               child: Container(
//                                 height: screenHeight * 0.1,
//                                 width: screenHeight * 0.1,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                         data['logo'] ?? data['image'] ?? "assets/images/china.png"),
//                                     fit: BoxFit.cover,
//                                   ),
//                                   borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.only(left: screenWidth * 0.02),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           data['name'] ?? "Unknown Hotel",
//                                           style: TextStyle(
//                                             fontSize: screenWidth * 0.045,
//                                             fontFamily: "poppins-bold",
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         Row(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
//                                                 setState(() {
//                                                   _isRestaurantLiked = !_isRestaurantLiked;
//                                                 });
//                                               },
//                                               child: SvgPicture.asset(
//                                                 _isRestaurantLiked
//                                                     ? "assets/icons/nonlike.svg"
//                                                     : "assets/icons/like.svg",
//                                                 width: screenWidth * 0.05,
//                                                 height: screenWidth * 0.05,
//                                               ),
//                                             ),
//                                             SizedBox(width: screenWidth * 0.012),
//                                             Image.asset(
//                                               "assets/icons/info.png",
//                                               width: screenWidth * 0.04,
//                                               height: screenWidth * 0.04,
//                                             ),
//                                             SizedBox(width: screenWidth * 0.012),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: screenHeight * 0.005),
//                                     Text(
//                                       data['cuisine'] ?? "N/A",
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.03,
//                                         fontFamily: "poppins",
//                                       ),
//                                     ),
//                                     SizedBox(height: screenHeight * 0.005),
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           _getStarIcon(
//                                               double.tryParse(data['rating']?.toString() ?? '0.0') ?? 0.0),
//                                           width: screenWidth * 0.05,
//                                           height: screenWidth * 0.05,
//                                         ),
//                                         SizedBox(width: screenWidth * 0.012),
//                                         Text(
//                                           data['rating']?.toString() ?? "N/A",
//                                           style: TextStyle(
//                                             fontSize: screenWidth * 0.035,
//                                             fontFamily: "poppins-bold",
//                                           ),
//                                         ),
//                                         SizedBox(width: screenWidth * 0.012),
//                                         Text(
//                                           "See ${data['reviews'] ?? 0} Reviews",
//                                           style: TextStyle(
//                                             fontFamily: "poppins",
//                                             color: Colors.green,
//                                             fontSize: screenWidth * 0.03,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: screenHeight * 0.012),
//                         Row(
//                           children: [
//                             const Spacer(),
//                             SvgPicture.asset(
//                               "assets/icons/clock.svg",
//                               width: screenWidth * 0.04,
//                               height: screenWidth * 0.04,
//                             ),
//                             SizedBox(width: screenWidth * 0.005),
//                             Text(
//                               data['time'] ?? "20-30 mins",
//                               style: TextStyle(
//                                 fontFamily: "poppins-bold",
//                                 fontSize: screenWidth * 0.03,
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               width: 2,
//                               height: screenHeight * 0.04,
//                               color: const Color(0XFFF1F0F5),
//                             ),
//                             const Spacer(),
//                             SvgPicture.asset(
//                               "assets/icons/delivary.svg",
//                               width: screenWidth * 0.04,
//                               height: screenWidth * 0.04,
//                             ),
//                             SizedBox(width: screenWidth * 0.005),
//                             Text(
//                               data['freeDelivery'] == true
//                                   ? "Free Delivery"
//                                   : "OMR ${data['deliveryPrice'] ?? '0.3584'}",
//                               style: TextStyle(
//                                 fontFamily: "poppins-bold",
//                                 fontSize: screenWidth * 0.03,
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               width: 2,
//                               height: screenHeight * 0.04,
//                               color: const Color(0XFFF1F0F5),
//                             ),
//                             const Spacer(),
//                             Column(
//                               children: [
//                                 Text(
//                                   "Delivered By",
//                                   style: TextStyle(
//                                     fontSize: screenWidth * 0.03,
//                                     fontFamily: "poppins-medium",
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     ShaderMask(
//                                       shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
//                                         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                                       ),
//                                       child: Text(
//                                         'Labbaik',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: screenWidth * 0.035,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: screenWidth * 0.005),
//                                     Image.asset(
//                                       "assets/icons/info.png",
//                                       width: screenWidth * 0.035,
//                                       height: screenWidth * 0.035,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                         const Spacer(),
//                         Padding(
//                           padding: EdgeInsets.all(screenWidth * 0.01),
//                           child: Container(
//                             height: screenHeight * 0.05,
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(20),
//                                 bottomLeft: Radius.circular(20),
//                               ),
//                             ),
//                             child: Center(
//                               child: ShaderMask(
//                                 shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
//                                 blendMode: BlendMode.srcIn,
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "Genie ",
//                                         style: TextStyle(
//                                           fontSize: screenWidth * 0.04,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text:
//                                         "Extra ${data['discount'] ?? '10%'} off above OMR ${data['minOrder'] ?? 400}",
//                                         style: TextStyle(
//                                           fontSize: screenWidth * 0.03,
//                                           fontFamily: "poppins-medium",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: screenHeight * 0.025,
//                   left: screenWidth * 0.05,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: screenHeight * 0.06,
//                         width: screenHeight * 0.06,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(screenWidth * 0.15),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(screenWidth * 0.01),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(screenWidth * 0.15),
//                               gradient: const LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                             ),
//                             child: Center(
//                               child: SvgPicture.asset("assets/icons/bell.svg"),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.012),
//                       Container(
//                         height: screenHeight * 0.06,
//                         width: screenWidth * 0.75,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(screenWidth * 0.15),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(screenWidth * 0.01),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(screenWidth * 0.15),
//                               gradient: const LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xFFFEE4E5),
//                                   Color.fromRGBO(254, 228, 229, 0.5),
//                                 ],
//                               ),
//                             ),
//                             child: Center(
//                               child: ShaderMask(
//                                 shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
//                                 blendMode: BlendMode.srcIn,
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "Active ",
//                                         style: TextStyle(
//                                           fontSize: screenWidth * 0.04,
//                                           fontFamily: "poppins-bold",
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: "Genie Subscription",
//                                         style: TextStyle(
//                                           fontSize: screenWidth * 0.03,
//                                           fontFamily: "poppins-medium",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.012),
//             Padding(
//               padding: EdgeInsets.all(screenWidth * 0.02),
//               child: Container(
//                 height: screenHeight * 0.08,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                   border: Border.all(color: Colors.grey.shade300, width: 1),
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(width: screenWidth * 0.025),
//                     SvgPicture.asset(
//                       "assets/icons/discount.svg",
//                       height: screenHeight * 0.05,
//                       width: screenWidth * 0.05,
//                     ),
//                     SizedBox(width: screenWidth * 0.02),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Items at OMR ${data['itemPrice'] ?? '0.380'}\n",
//                             style: TextStyle(
//                               fontFamily: "poppins-bold",
//                               fontSize: screenWidth * 0.035,
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextSpan(
//                             text: "on selected items",
//                             style: TextStyle(
//                               fontFamily: "poppins-medium",
//                               fontSize: screenWidth * 0.03,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Spacer(),
//                     Padding(
//                       padding: EdgeInsets.all(screenWidth * 0.02),
//                       child: Text(
//                         "1/3",
//                         style: TextStyle(fontSize: screenWidth * 0.03),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(screenWidth * 0.02),
//               child: Container(
//                 height: screenHeight * 0.07,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "search for dishes",
//                     prefixIcon: Icon(
//                       Icons.search,
//                       size: screenWidth * 0.05,
//                     ),
//                     suffixIcon: Icon(
//                       Icons.mic,
//                       color: Colors.red,
//                       size: screenWidth * 0.05,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SectionHeader(title: 'Top Views', onSeeAll: () {}),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: topViewData.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final item = entry.value;
//                   return Padding(
//                     padding: EdgeInsets.only(
//                       left: screenWidth * 0.032,
//                       top: screenHeight * 0.01,
//                     ),
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: screenHeight * 0.3,
//                           width: screenWidth * 0.55,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(screenWidth * 0.05),
//                             image: DecorationImage(
//                               image: AssetImage( "assets/images/china.png"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: screenHeight * 0.12,
//                             width: screenWidth * 0.52,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(screenWidth * 0.05),
//                                 bottomRight: Radius.circular(screenWidth * 0.05),
//                               ),
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.transparent,
//                                   Colors.black.withOpacity(0.9),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: screenHeight * 0.012,
//                           right: screenWidth * 0.021,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 print("Tapped item at index $index, isLiked: ${item['isLiked']} -> ${!item['isLiked']}");
//                                 topViewData[index]['isLiked'] = !item['isLiked'];
//                               });
//                             },
//                             child: SvgPicture.asset(
//                               item['isLiked'] ? "assets/icons/like.svg" : "assets/icons/nonlike.svg",
//                               height: screenHeight * 0.03,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: screenWidth * 0.045,
//                           bottom: screenHeight * 0.02,
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "${item['discount'] ?? 'No discount'}\n",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: screenWidth * 0.04,
//                                     color: Colors.white,
//                                     fontFamily: "poppins-bold",
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: item['maxDiscount'] ?? 'N/A',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: screenWidth * 0.027,
//                                     color: const Color(0xFFDEDEDE),
//                                     fontFamily: "poppins-medium",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: screenHeight * 0.02,
//                           right: screenWidth * 0.03,
//                           child: Container(
//                             height: screenHeight * 0.04,
//                             width: screenWidth * 0.12,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                               gradient: AppColors.primaryGradient,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "ADD",
//                                 style: TextStyle(
//                                   fontFamily: "poppins-bold",
//                                   color: Colors.white,
//                                   fontSize: screenWidth * 0.03,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             SectionHeader(title: "Recommended(70)",onSeeAll: (){},),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 220,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   //color: Colors.amberAccent,
//                   borderRadius: BorderRadius.circular(screenWidth * 0.05),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 child: SvgPicture.asset(
//                                   'assets/icons/nonvegsymbol.svg',
//                                   height: 20,
//                                   width: 20,
//                                 ),
//                               ),
//                               SizedBox(width: 4),
//                               Container(
//                                 child: SvgPicture.asset(
//                                   'assets/icons/bestseller.svg',
//                                   height: 20,
//                                   width: 20,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5,),
//                           Text("Tandoori Indian \nChicken",style: TextStyle(fontFamily: "poppins-bold",fontSize: 18),),
//                           ShaderMask(
//                             shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
//                               Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                             ),
//                             child: Text(
//                               'OMR 0.254',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: screenWidth * 0.035,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "poppins-bold",
//                               ),
//                             ),
//                           ),
//                           // SizedBox(width: 2,),
//                           // Container(
//                           //   height: 12,
//                           //   width: 2,
//                           //   color: Colors.red,
//                           // ),
//                           // SizedBox(width: 2,),
//                           ShaderMask(
//                             shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
//                               Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                             ),
//                             child: Text(
//                               'On Buy 2 Get 1 Free',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: screenWidth * 0.032,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "poppins-semibold",
//                               ),
//                             ),
//                           ),
//                           Text("Roll made with flasky laches \nparata,perfectly fried \nchicken strips",style: TextStyle(fontFamily: "poppins-semibold",fontSize: 12),),
//                           SizedBox(height: 5,),
//                           Row(
//                             children: [
//                               Container(
//                                 height: 30,
//                                 width: 60,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(screenWidth * 0.01),
//                                   color: Color(0XFF00602B)
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Icon(Icons.star,color: Colors.white,size: 16,),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Text("4.6",style: TextStyle(color: Colors.white,fontFamily: "poppins-bold"),),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5,),
//                               Text("{220}",style: TextStyle(fontSize: 18),)
//                             ],
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       SizedBox(
//                         height: 180,
//                         width: 180,
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Container(
//                               height: 180,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                                 image: DecorationImage(
//                                   image: AssetImage("assets/images/china.png"),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 15,
//                               right: 15,
//                                 child: SvgPicture.asset("assets/icons/nonlike.svg")),
//                             Positioned(
//                               bottom: -13,
//                               left: 50,
//                               child: Container(
//                                 height: 30,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(screenWidth * 0.025),
//                                   gradient: AppColors.primaryGradient,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(width: 25,),
//                                     Center(
//                                       child: Text("ADD",style: TextStyle(fontFamily: "poppins-bold",color: Colors.white,fontSize: screenWidth * 0.042),),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 8.0,top: 6,right: 8),
//                                         child: SvgPicture.asset("assets/icons/plus.svg")
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
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
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../utils/themes.dart';
import '../../../widgets/cards/widgets.dart';

class Viewhotel extends StatefulWidget {
  final Map<String, dynamic> restaurantData;

  const Viewhotel({super.key, required this.restaurantData});

  @override
  State<Viewhotel> createState() => _ViewhotelState();
}

class _ViewhotelState extends State<Viewhotel> {
  bool _isRestaurantLiked = false; // State for restaurant like button
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
    },
    {
      'name': 'Vegetable Biryani',
      'image': 'assets/images/biryani.png',
      'price': '0.180',
      'offer': '10% off',
      'description': 'Aromatic rice with mixed vegetables and spices',
      'rating': '4.2',
      'reviews': '150',
      'isVeg': true,
      'isBestSeller': false,
      'isLiked': false,
    },
    {
      'name': 'Paneer Tikka',
      'image': 'assets/images/paneer.png',
      'price': '0.220',
      'offer': '15% off',
      'description': 'Grilled paneer cubes with spicy marinade',
      'rating': '4.8',
      'reviews': '300',
      'isVeg': true,
      'isBestSeller': true,
      'isLiked': false,
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
        'image': 'assets/images/dish1.png',
        'name': 'Spicy Noodles',
        'discount': '20% off',
        'maxDiscount': 'OMR 0.500',
        'isLiked': false,
      },
      {
        'image': 'assets/images/dish2.png',
        'name': 'Grilled Chicken',
        'discount': '15% off',
        'maxDiscount': 'OMR 0.300',
        'isLiked': false,
      },
      {
        'image': 'assets/images/dish3.png',
        'name': 'Veggie Pizza',
        'discount': '10% off',
        'maxDiscount': 'OMR 0.200',
        'isLiked': false,
      },
      {
        'image': 'assets/images/dish4.png',
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
                        child: Row(
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
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Text(
                                "${_currentCarouselIndex + 1}/${discountData.length}",
                                style: TextStyle(fontSize: screenWidth * 0.03),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: discountData.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => (entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentCarouselIndex == entry.key
                                ? Colors.black
                                : Colors.grey.shade400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Container(
                height: screenHeight * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search for dishes",
                    prefixIcon: Icon(
                      Icons.search,
                      size: screenWidth * 0.05,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.red,
                      size: screenWidth * 0.05,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
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
                                              ? 'assets/icons/vegsymbol.svg'
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
                                          height: 30,
                                          width: 60,
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
                                                  size: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text(
                                                  item['rating'],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "poppins-bold",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "(${item['reviews']})",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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