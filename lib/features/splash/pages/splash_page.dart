import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/animations/fade_animation.dart';
import 'package:flutter_ui_examples/features/login/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _scaleCtl;
  late AnimationController _scale2Ctl;
  late AnimationController _widthCtl;
  late AnimationController _positionCtl;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool flagIconIsHidden = false;

  @override
  void initState() {
    super.initState();

    _scaleCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween(
      begin: 1.0,
      end: 0.8,
    ).animate(_scaleCtl)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _widthCtl.forward();
          }
        },
      );

    _widthCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0,
    ).animate(_widthCtl)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _positionCtl.forward();
          }
        },
      );

    _positionCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 220.0,
    ).animate(_positionCtl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          flagIconIsHidden = true;
          _scale2Ctl.forward();
        }
      });

    _scale2Ctl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _scale2Animation = Tween<double>(
      begin: 1.0,
      end: 32.0,
    ).animate(_scale2Ctl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).push(PageTransition(
            child: const LoginPage(),
            type: PageTransitionType.fade,
          ));
        }
      });
  }

  @override
  void dispose() {
    super.dispose();

    _scaleCtl.dispose();
    _scale2Ctl.dispose();
    _widthCtl.dispose();
    _positionCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                delay: 1.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/one.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                delay: 1.3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/one.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                delay: 1.6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/one.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const FadeAnimation(
                    delay: 1.0,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  FadeAnimation(
                    delay: 1.3,
                    child: Text(
                      "We promis that you'll have the most \nfuss-free time with us ever.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: 20,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 180),
                  FadeAnimation(
                    delay: 1.6,
                    child: AnimatedBuilder(
                      animation: _scaleCtl,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthAnimation,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              height: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.withOpacity(.4),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _scaleCtl.forward();
                                },
                                child: Stack(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _positionCtl,
                                      builder: (context, child) => Positioned(
                                        left: _positionAnimation.value,
                                        child: AnimatedBuilder(
                                          animation: _scale2Ctl,
                                          builder: (context, child) =>
                                              Transform.scale(
                                            scale: _scale2Animation.value,
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: flagIconIsHidden == false
                                                  ? const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
