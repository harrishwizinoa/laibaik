import 'package:flutter/material.dart';
import 'package:laibaik/users/widgets/curve_Edge.dart';
import '../../main.dart';
import '../widgets/custom_shape.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurveEdge(
            child:  Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: colors.primaryGradient
              ),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                        top: -150,right: -250,
                        child: Tcircle(backgroundcolor: Colors.white.withOpacity(0.1),)),
                    Positioned(
                        top: 100,right: -300,
                        child: Tcircle(backgroundcolor: Colors.white.withOpacity(0.1),)),
                    Positioned(
                        left: -10,top: 220,
                        child: Tcircle( height:150, width:150,radius:100,backgroundcolor: Colors.white.withOpacity(0.1),))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
