import 'package:flutter/material.dart';
import 'package:personal_profile/common/animations/fade_animation.dart';
import 'package:personal_profile/features/personal_profile/widgets/card_movie_widget.dart';

class PersonalProflePage extends StatefulWidget {
  const PersonalProflePage({super.key});

  @override
  State<PersonalProflePage> createState() => _PersonalProflePageState();
}

class _PersonalProflePageState extends State<PersonalProflePage> {
  List<String> movies = [
    "assets/images/emma-1.jpg",
    "assets/images/emma-2.jpg",
    "assets/images/emma-3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/emma.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const FadeAnimation(
                              delay: 1,
                              child: Text(
                                'Emma Watson',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: const <Widget>[
                                FadeAnimation(
                                  delay: 1.2,
                                  child: Text(
                                    '60 Videos',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50),
                                FadeAnimation(
                                  delay: 1.2,
                                  child: Text(
                                    '240K Subscribers',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const FadeAnimation(
                              delay: 1.4,
                              child: Text(
                                'Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const FadeAnimation(
                              delay: 1.6,
                              child: Text(
                                'Born',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const FadeAnimation(
                              delay: 1.6,
                              child: Text(
                                'April, 15th 1990, Paris, France',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const FadeAnimation(
                              delay: 1.8,
                              child: Text(
                                'Nationality',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const FadeAnimation(
                              delay: 1.8,
                              child: Text(
                                'British',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const FadeAnimation(
                              delay: 1.8,
                              child: Text(
                                'Videos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            FadeAnimation(
                              delay: 1.8,
                              child: SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movies.length,
                                  itemBuilder: ((_, index) =>
                                      CardMovieWidget(image: movies[index])),
                                ),
                              ),
                            ),
                            const SizedBox(height: 120),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                delay: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Align(
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
