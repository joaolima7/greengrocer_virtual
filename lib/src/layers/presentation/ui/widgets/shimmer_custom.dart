import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final Color? baseColor;
  final Color? highlightColor;
  final bool isRounded;
  final BorderRadius? borderRadius;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.isRounded = false,
    this.baseColor,
    this.borderRadius,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            borderRadius: borderRadius ??
                BorderRadius.circular(isRounded ? height / 2 : 0),
          ),
        ),
        baseColor: baseColor ?? Colors.grey.shade800,
        highlightColor: highlightColor ?? Colors.grey.shade500,
      ),
    );
  }
}
