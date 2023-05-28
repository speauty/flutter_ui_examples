import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/features/button_animation/widgets/button_widget.dart';

class ButtonAnimationPage extends StatefulWidget {
  const ButtonAnimationPage({super.key});

  @override
  State<ButtonAnimationPage> createState() => _ButtonAnimationPageState();
}

class _ButtonAnimationPageState extends State<ButtonAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ButtonWidget(
                title: "Download Primary",
                primaryColor: Color.fromRGBO(57, 92, 249, 1),
                darkPrimaryColor: Color.fromRGBO(48, 78, 233, 1),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                title: "Download Warning",
                primaryColor: Colors.yellow[700]!,
                darkPrimaryColor: Colors.yellow[800]!,
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                title: "Download Notice",
                primaryColor: Colors.green[400]!,
                darkPrimaryColor: Colors.green[600]!,
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                title: "Download Error",
                primaryColor: Colors.red[700]!,
                darkPrimaryColor: Colors.red[800]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
