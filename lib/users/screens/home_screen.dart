// import 'package:flutter/material.dart';
// import '../widgets/cards/category_card.dart';
// import '../widgets/primaryHeader.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             // stops: [0.0421, 0.9579],
//             colors: [
//               Color(0xFFFFFFFF),
//               //Color(0xFFFDCECF),
//               Color(0xB6FDCECF),
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               primaryHeader(),
//               ServiceGrid(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../widgets/cards/category_card.dart';
import '../widgets/primaryHeader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xB6FDCECF),
            ],
          ),
        ),
        child: Column(
          children: [
            primaryHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: ServiceGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}