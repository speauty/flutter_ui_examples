import 'package:flutter/material.dart';
import 'package:inspiration/features/inspiration/pages/inspiration_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Roboto"),
        home: const InspirationPage(),
      ),
    );
