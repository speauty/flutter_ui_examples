import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/animations/fade_animation.dart';

class LoginPurplePage extends StatefulWidget {
  const LoginPurplePage({super.key});

  @override
  State<LoginPurplePage> createState() => _LoginPurplePageState();
}

class _LoginPurplePageState extends State<LoginPurplePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    width: width,
                    height: 400,
                    child: FadeAnimation(
                      delay: 1.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/login2_bg1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: width + 20,
                    height: 400,
                    child: FadeAnimation(
                      delay: 1.3,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/login2_bg2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeAnimation(
                    delay: 1.5,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeAnimation(
                    delay: 1.7,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[200]!),
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const FadeAnimation(
                    delay: 1.7,
                    child: Center(
                        child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color.fromRGBO(196, 135, 198, 1),
                      ),
                    )),
                  ),
                  const SizedBox(height: 30),
                  FadeAnimation(
                    delay: 1.9,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const FadeAnimation(
                    delay: 2,
                    child: Center(
                        child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, .6),
                      ),
                    )),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
