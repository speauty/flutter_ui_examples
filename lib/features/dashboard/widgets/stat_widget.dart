import 'package:flutter/material.dart';
import 'package:ui_page_transition/common/animations/fade_animation.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
    Key? key,
    required this.margin,
    required this.name,
    required this.val,
    required this.gradient,
  }) : super(key: key);

  final String name;
  final String val;
  final EdgeInsets margin;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeAnimation(
        delay: 1,
        child: Container(
          width: 100,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: gradient,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  delay: 1.2,
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeAnimation(
                  delay: 1.4,
                  child: Text(
                    val,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
