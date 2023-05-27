import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  final double top;
  final double left;

  const PointWidget({
    Key? key,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: AvatarGlow(
          endRadius: 40,
          curve: Curves.linear,
          animate: true,
          repeatPauseDuration: const Duration(milliseconds: 500),
          glowColor: Colors.blue.shade300,
          child: Container(
            width: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blue.shade700),
          )),
    );
  }
}
