import 'package:flutter/material.dart';
import 'curved_container.dart';

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