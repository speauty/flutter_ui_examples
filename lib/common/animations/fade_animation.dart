import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
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
              end: const Duration(milliseconds: 500))
          .tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 500))
          .tween('translateY', Tween(begin: 60.0, end: 0.0));

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: tween,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.translate(
          offset: Offset(0, value.get('translateY')),
          child: child,
        ),
      ),
    );
  }
}
