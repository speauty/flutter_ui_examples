import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
      ).tween('opacity', Tween<double>(begin: 0.0, end: 1.0))
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      ).tween('translateY', Tween<double>(begin: -30.0, end: 0.0));
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
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
