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
      ).tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      ).tween('tranlateY', Tween(begin: -30.0, end: 0.0));
    return PlayAnimationBuilder(
      tween: tween,
      delay: Duration(milliseconds: (delay * 500).round()),
      duration: tween.duration,
      child: child,
      builder: (context, attrs, child) => Opacity(
        opacity: attrs.get('opacity'),
        child: Transform.translate(
          offset: Offset(0.0, attrs.get('tranlateY')),
          child: child,
        ),
      ),
    );
  }
}
