import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;

  const CircleContainer({
    super.key,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.padding=0,
    this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
