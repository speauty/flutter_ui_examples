import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ui_page_transition/features/dashboard/pages/dashboard_page.dart';
import 'package:ui_page_transition/features/exercise/widgets/page_item_widget.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage>
    with TickerProviderStateMixin {
  late PageController pageCtl;

  late AnimationController ripperCtl;
  late AnimationController scaleCtl;
  late Animation<double> ripperAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    pageCtl = PageController(
      initialPage: 0,
    );

    ripperCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    ripperAnimation = Tween(
      begin: 80.0,
      end: 90.0,
    ).animate(ripperCtl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          ripperCtl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          ripperCtl.forward();
        }
      });

    scaleCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    scaleAnimation = Tween(
      begin: 1.0,
      end: 30.0,
    ).animate(scaleCtl)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).push(PageTransition(
            child: const DashboardPage(),
            type: PageTransitionType.fade,
          ));
        }
      });

    ripperCtl.forward();
  }

  @override
  void dispose() {
    pageCtl.dispose();
    ripperCtl.dispose();
    scaleCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageCtl,
        children: <Widget>[
          PageItemWidget(
            ripperCtl: ripperCtl,
            ripperAnimation: ripperAnimation,
            scaleCtl: scaleCtl,
            scaleAnimation: scaleAnimation,
            image: 'assets/images/one.jpg',
          ),
          PageItemWidget(
            ripperCtl: ripperCtl,
            ripperAnimation: ripperAnimation,
            scaleCtl: scaleCtl,
            scaleAnimation: scaleAnimation,
            image: 'assets/images/two.jpg',
          ),
          PageItemWidget(
            ripperCtl: ripperCtl,
            ripperAnimation: ripperAnimation,
            scaleCtl: scaleCtl,
            scaleAnimation: scaleAnimation,
            image: 'assets/images/three.jpg',
          ),
        ],
      ),
    );
  }
}
