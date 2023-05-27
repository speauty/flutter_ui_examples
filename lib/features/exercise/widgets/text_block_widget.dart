import 'package:flutter/material.dart';
import 'package:ui_page_transition/common/animations/fade_animation.dart';

class TextBlockWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;

  const TextBlockWidget({
    Key? key,
    required this.textOne,
    required this.textTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(
          delay: 1,
          child: Text(
            textOne,
            style: TextStyle(
              color: Colors.yellow[400],
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FadeAnimation(
          delay: 1.2,
          child: Text(
            textTwo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
