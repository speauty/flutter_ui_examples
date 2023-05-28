import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/features/splash/pages/splash_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        home: const SplashPage(),
      ),
    );
