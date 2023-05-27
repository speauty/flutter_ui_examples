import 'package:flutter/material.dart';
import 'package:ui_page_transition/common/animations/fade_animation.dart';
import 'package:ui_page_transition/features/exercise/widgets/text_block_widget.dart';

class PageItemWidget extends StatelessWidget {
  const PageItemWidget({
    Key? key,
    required this.ripperCtl,
    required this.ripperAnimation,
    required this.scaleCtl,
    required this.scaleAnimation,
    required this.image,
  }) : super(key: key);

  final AnimationController ripperCtl;
  final Animation<double> ripperAnimation;
  final AnimationController scaleCtl;
  final Animation<double> scaleAnimation;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              const FadeAnimation(
                delay: 1,
                child: Text(
                  'Exercises 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextBlockWidget(textOne: "15", textTwo: "Minutes"),
              const SizedBox(height: 10),
              const TextBlockWidget(textOne: "3", textTwo: "Exercises"),
              const SizedBox(height: 120),
              const FadeAnimation(
                delay: 1,
                child: Align(
                  child: Text(
                    'Start the morning with your health',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeAnimation(
                delay: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: ripperAnimation,
                    builder: ((context, child) => SizedBox(
                          width: ripperAnimation.value,
                          height: ripperAnimation.value,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(.4),
                            ),
                            child: InkWell(
                              onTap: () {
                                scaleCtl.forward();
                              },
                              child: AnimatedBuilder(
                                animation: scaleAnimation,
                                builder: ((context, child) => Transform.scale(
                                      scale: scaleAnimation.value,
                                      child: Container(
                                        margin: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
