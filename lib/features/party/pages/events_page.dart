import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/animations/fade_animation.dart';
import 'package:flutter_ui_examples/features/party/widgets/event_widget.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/four.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(15, -15),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                delay: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search Event",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const FadeAnimation(
                  delay: 1.2,
                  child:
                      EventWidget(image: "assets/images/one.jpg", date: "17d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.3,
                  child:
                      EventWidget(image: "assets/images/two.jpg", date: "18d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.4,
                  child: EventWidget(
                      image: "assets/images/three.jpg", date: "19d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.5,
                  child: EventWidget(
                      image: "assets/images/four.jpg", date: "21d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.6,
                  child: EventWidget(
                      image: "assets/images/five.jpg", date: "24d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.7,
                  child:
                      EventWidget(image: "assets/images/six.jpg", date: "27d")),
              const SizedBox(height: 20),
              const FadeAnimation(
                  delay: 1.8,
                  child: EventWidget(
                      image: "assets/images/seven.jpg", date: "28d")),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
