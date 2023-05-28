import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color darkPrimaryColor;

  const ButtonWidget({
    super.key,
    required this.primaryColor,
    required this.darkPrimaryColor,
    required this.title,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationCtl;
  late AnimationController _scaleAnimationCtl;
  late AnimationController _fadeAnimationCtl;

  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  double btnWidth = 200.0;
  double barColorOpacity = .6;
  double scale = 1.0;
  bool animationCompleted = false;
  bool animationStarted = false;

  @override
  void initState() {
    super.initState();

    _animationCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimationCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimationCtl = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(_fadeAnimationCtl);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_scaleAnimationCtl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleAnimationCtl.reverse();
          _fadeAnimationCtl.forward();
          _animationCtl.forward();
        }
      });

    _animation = Tween<double>(
      begin: 0.0,
      end: btnWidth,
    ).animate(_animationCtl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            animationCompleted = true;
            barColorOpacity = .0;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();

    _animationCtl.dispose();
    _scaleAnimationCtl.dispose();
    _fadeAnimationCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _scaleAnimationCtl,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              onTap: () {
                _scaleAnimationCtl.forward();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: widget.primaryColor,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: animationCompleted == false
                            ? Text(widget.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ))
                            : const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animationCtl,
                      builder: (context, child) => Container(
                        width: _fadeAnimation.value,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: widget.darkPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationCtl,
          builder: (context, child) => Positioned(
            top: 0,
            left: 0,
            width: _animation.value,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: barColorOpacity,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
