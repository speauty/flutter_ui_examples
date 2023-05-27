import 'package:flutter/material.dart';
import 'package:ripple_map/features/ripple_map/widgets/card_item_widget.dart';
import 'package:ripple_map/features/ripple_map/widgets/point_widget.dart';

class RippleMapPage extends StatefulWidget {
  const RippleMapPage({super.key});

  @override
  State<RippleMapPage> createState() => _RippleMapPageState();
}

class _RippleMapPageState extends State<RippleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
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
                    Colors.black.withOpacity(.3),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 230,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardItemWidget(
                            image: "assets/images/place.jpg",
                          ),
                          CardItemWidget(
                            image: "assets/images/place2.jpg",
                          ),
                          CardItemWidget(
                            image: "assets/images/place3.jpg",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          const PointWidget(top: 140.0, left: 60.0),
          const PointWidget(top: 190.0, left: 80.0),
          const PointWidget(top: 219.0, left: 150.0),
        ],
      ),
    );
  }
}
