import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
      ).tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      ).tween('translateY', Tween(begin: -30.0, end: 0.0));

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration, // Obtain duration
      tween: tween,
      child: child, // Pass in tween
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, value.get('translateY')),
            child: child,
          ),
        );
      },
    );
  }
}
