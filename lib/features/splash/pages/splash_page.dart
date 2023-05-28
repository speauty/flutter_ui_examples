import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/animations/fade_animation.dart';
import 'package:flutter_ui_examples/features/party/pages/events_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation _blinkAnimation;

  late AnimationController _scaleController;
  late Animation _scaleAnimation;

  bool flagBtnIsHidden = false;

  @override
  void initState() {
    super.initState();

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _blinkAnimation = Tween<double>(
      begin: 0.6,
      end: 0.3,
    ).animate(_blinkController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _blinkController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _blinkController.forward();
        }
      });
    _blinkController.forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).push(PageTransition(
            child: const EventsPage(),
            type: PageTransitionType.fade,
          ));
        }
      });
  }

  @override
  void dispose() {
    super.dispose();

    _blinkController.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.6),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FadeAnimation(
                  delay: 1.0,
                  child: Text(
                    'Find the best locations near you for a good night.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.1),
                  ),
                ),
                const SizedBox(height: 30),
                FadeAnimation(
                  delay: 1.2,
                  child: Text(
                    'Let us find you an event for your interest',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                FadeAnimation(
                  delay: 1.4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        flagBtnIsHidden = true;
                      });
                      _scaleController.forward();
                    },
                    child: AnimatedBuilder(
                      animation: _scaleAnimation,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: AnimatedBuilder(
                          animation: _blinkAnimation,
                          builder: (context, child) => Container(
                            padding: const EdgeInsets.all(5),
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.yellow
                                  .withOpacity(_blinkAnimation.value),
                            ),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.yellow[700],
                              ),
                              child: flagBtnIsHidden == false
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text(
                                          'Find nearest event',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
