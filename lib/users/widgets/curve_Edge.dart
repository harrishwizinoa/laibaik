import 'package:flutter/material.dart';
import 'curved_container.dart';

class CurvesEdge extends StatelessWidget {
  const CurvesEdge({
    super.key,this.child
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF5F5F5),
      child: ClipPath(
          clipper: CurveContainer(),
          child:child
      ),
    );
  }
}
class CurveEdge extends StatelessWidget {
  const CurveEdge({
    super.key,this.child
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CurveContainer(),
        child:child
    );
  }
}