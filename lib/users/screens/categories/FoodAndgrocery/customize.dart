// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class Customize extends StatefulWidget {
//   const Customize({super.key});
//
//   @override
//   State<Customize> createState() => _CustomizeState();
//
//   static void show(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => const Customize(),
//     );
//   }
// }
//
// class _CustomizeState extends State<Customize> {
//   final List<Map<String, dynamic>> items = [
//     {'name': 'Chicken Carve', 'price': 'OMR 0.125'},
//     {'name': 'Spicy Chicken', 'price': 'OMR 0.150'},
//     {'name': 'Grilled Chicken', 'price': 'OMR 0.175'},
//   ];
//   late List<bool> selections;
//   bool selectAll = false;
//
//   @override
//   void initState() {
//     super.initState();
//     selections = List.generate(items.length, (_) => false);
//   }
//
//   void toggleSelectAll() {
//     setState(() {
//       selectAll = !selectAll;
//       selections = List.generate(items.length, (_) => selectAll);
//     });
//   }
//
//   void toggleItem(int index) {
//     setState(() {
//       selections[index] = !selections[index];
//       selectAll = selections.every((selected) => selected);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         height: 550,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   width: 40,
//                   height: 5,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     height: 400,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/background.jpg"),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//                     ),
//                   ),
//                   Positioned(
//                     top: 35,
//                     left: 15,
//                     child: GestureDetector(
//                       onTap: Get.back,
//                       child: const Icon(Icons.close, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Heading Section
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Chicken Meals",
//                           style: TextStyle(
//                             fontFamily: "poppins",
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "Savor our delicious chicken meals, made with fresh ingredients and bold spices.",
//                           style: TextStyle(fontFamily: "poppins", fontSize: 14),
//                         ),
//                         SizedBox(height: 16),
//                       ],
//                     ),
//                     // Selection Section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildChoiceRow(
//                           "Your Choice Of Crust",
//                           "Select all",
//                           selectAll,
//                           toggleSelectAll,
//                           isBold: true,
//                           unselectedIcon: 'assets/icons/thickround.svg',
//                         ),
//                         SizedBox(height: 10),
//                         ...List.generate(
//                           items.length,
//                               (index) => Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: _buildChoiceRow(
//                               items[index]['name'],
//                               items[index]['price'],
//                               selections[index],
//                                   () => toggleItem(index),
//                               isBold: false,
//                               unselectedIcon: 'assets/icons/Rnonactive.svg',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildChoiceRow(
//       String title,
//       String subtitle,
//       bool value,
//       VoidCallback onTap, {
//         required bool isBold,
//         required String unselectedIcon,
//       }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontFamily: isBold ? "poppins-bold":"poppins",
//             fontSize: isBold ? 16 : 12,
//           ),
//         ),
//         Row(
//           children: [
//             Text(
//               subtitle,
//               style: TextStyle(
//                 fontFamily: isBold ? "poppins-bold":"poppins",
//                 fontSize: isBold ? 16 : 12,
//               ),
//             ),
//             SizedBox(width: 2),
//             GestureDetector(
//               onTap: onTap,
//               child: SvgPicture.asset(
//                 value ? 'assets/icons/Ractive.svg' : unselectedIcon,
//                 width: 20,
//                 height: 20,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Customize extends StatefulWidget {
  const Customize({super.key});

  @override
  State<Customize> createState() => _CustomizeState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const Customize(),
    );
  }
}

class _CustomizeState extends State<Customize> {
  final List<Map<String, dynamic>> crustItems = [
    {'name': 'Chicken Carve', 'price': 'OMR 0.100'},
    {'name': 'Chicken lollypop', 'price': 'OMR 0.100'},
    {'name': 'Chicken Biryani', 'price': 'OMR 0.100'},
  ];

  final List<Map<String, dynamic>> soupItems = [
    {'name': 'Chicken Baroda', 'price': 'OMR 0.100'},
    {'name': 'Chicken Piece', 'price': 'OMR 0.100'},
    {'name': 'Chicken Crave', 'price': 'OMR 0.100'},
    {'name': 'Chicken Shawarma', 'price': 'OMR 0.100'},
  ];

  late List<bool> crustSelections;
  late List<bool> soupSelections;
  bool crustSelectAll = false;
  bool soupSelectAll = false;

  @override
  void initState() {
    super.initState();
    crustSelections = List.generate(crustItems.length, (_) => false);
    soupSelections = List.generate(soupItems.length, (_) => false);
  }

  void toggleCrustSelectAll() {
    setState(() {
      crustSelectAll = !crustSelectAll;
      crustSelections = List.generate(crustItems.length, (_) => crustSelectAll);
    });
  }

  void toggleSoupSelectAll() {
    setState(() {
      soupSelectAll = !soupSelectAll;
      soupSelections = List.generate(soupItems.length, (_) => soupSelectAll);
    });
  }

  void toggleCrustItem(int index) {
    setState(() {
      crustSelections[index] = !crustSelections[index];
      crustSelectAll = crustSelections.every((selected) => selected);
    });
  }

  void toggleSoupItem(int index) {
    setState(() {
      soupSelections[index] = !soupSelections[index];
      soupSelectAll = soupSelections.every((selected) => selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 550,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 15,
                    child: GestureDetector(
                      onTap: Get.back,
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading Section
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chicken Meals",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Savor the taste of our delicious chicken meals, made with fresh ingredients and bold spices. Whether it’s juicy grilled, crispy fried, or rich curry, each bite delivers mouth-watering flavor and perfect satisfaction.",
                          style: TextStyle(fontFamily: "poppins", fontSize: 14),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    // Crust Selection Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChoiceRow(
                          "Your Choice Of Crust",
                          "Select all",
                          crustSelectAll,
                          toggleCrustSelectAll,
                          isBold: true,
                          unselectedIcon: 'assets/icons/thickround.svg',
                        ),
                        SizedBox(height: 10),
                        ...List.generate(
                          crustItems.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildChoiceRow(
                              crustItems[index]['name'],
                              crustItems[index]['price'],
                              crustSelections[index],
                                  () => toggleCrustItem(index),
                              isBold: false,
                              unselectedIcon: 'assets/icons/Rnonactive.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Soup Selection Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChoiceRow(
                          "Your Choice Of Soup",
                          "Select all",
                          soupSelectAll,
                          toggleSoupSelectAll,
                          isBold: true,
                          unselectedIcon: 'assets/icons/thickround.svg',
                        ),
                        SizedBox(height: 10),
                        ...List.generate(
                          soupItems.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildChoiceRow(
                              soupItems[index]['name'],
                              soupItems[index]['price'],
                              soupSelections[index],
                                  () => toggleSoupItem(index),
                              isBold: false,
                              unselectedIcon: 'assets/icons/Rnonactive.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceRow(
      String title,
      String subtitle,
      bool value,
      VoidCallback onTap, {
        required bool isBold,
        required String unselectedIcon,
      }) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isBold == false)
          CircleAvatar(
          backgroundImage: AssetImage("assets/images/china.png"),
        ) ,
        SizedBox(width: 8,),
        Text(
          title,
          style: TextStyle(
            fontFamily: isBold ? "poppins-bold":"poppins",
            fontSize: isBold ? 16 : 12,
          ),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: isBold ? "poppins-bold":"poppins",
                fontSize: isBold ? 16 : 12,
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                value ? 'assets/icons/Ractive.svg' : unselectedIcon,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}