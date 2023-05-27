import 'package:flutter/material.dart';
import 'package:ui_page_transition/common/animations/fade_animation.dart';
import 'package:ui_page_transition/features/dashboard/widgets/health_category_item_widget.dart';
import 'package:ui_page_transition/features/dashboard/widgets/stat_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> healthCategories = ["Walking", "Running", "Swimning"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Dashboard',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20,
          ),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/one.jpg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              FadeAnimation(
                delay: 1,
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  StatWidget(
                    name: "Steps",
                    val: "3 500",
                    margin: const EdgeInsets.only(right: 10),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blue.withOpacity(.7),
                    ]),
                  ),
                  StatWidget(
                    name: "Sports",
                    val: "25 Min",
                    margin: const EdgeInsets.only(left: 10),
                    gradient: LinearGradient(colors: [
                      Colors.pink,
                      Colors.red.withOpacity(.7),
                    ]),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              FadeAnimation(
                delay: 1,
                child: Text(
                  'Health Categories',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 1,
                      child: HealthCategoryItemWidget(
                          name: healthCategories[0], isLast: false),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: HealthCategoryItemWidget(
                          name: healthCategories[1], isLast: false),
                    ),
                    FadeAnimation(
                      delay: 1.4,
                      child: HealthCategoryItemWidget(
                          name: healthCategories[2], isLast: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
