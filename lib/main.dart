import 'package:flutter/material.dart';
import 'package:trip/features/trip/pages/trip_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Nunito",
        ),
        home: const TripPage(),
      ),
    );
