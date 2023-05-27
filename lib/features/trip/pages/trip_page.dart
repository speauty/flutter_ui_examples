import 'package:flutter/material.dart';
import 'package:trip/features/trip/widgets/card_page_widget.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageCtl;

  void _pageOnScroll() {}

  @override
  void initState() {
    _pageCtl = PageController(
      initialPage: 0,
    )..addListener(_pageOnScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const <Widget>[
          CardPageWidget(
            page: 1,
            totalPage: 4,
            image: 'assets/images/one.jpg',
            title: 'Yosemite National Park',
            desc:
                'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
          ),
          CardPageWidget(
            page: 2,
            totalPage: 4,
            image: 'assets/images/two.jpg',
            title: 'Golden Gate Bridge',
            desc:
                'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
          ),
          CardPageWidget(
            page: 3,
            totalPage: 4,
            image: 'assets/images/three.jpg',
            title: 'Sedona',
            desc:
                "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
          ),
          CardPageWidget(
            page: 4,
            totalPage: 4,
            image: 'assets/images/four.jpg',
            title: 'Savannah',
            desc:
                "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.ds",
          ),
        ],
      ),
    );
  }
}
