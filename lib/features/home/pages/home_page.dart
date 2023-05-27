import 'package:flutter/material.dart';
import 'package:takeaway/common/animations/fade_animation.dart';
import 'package:takeaway/features/home/widgets/card_category_widget.dart';
import 'package:takeaway/features/home/widgets/card_food_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [
    {
      "id": 1,
      "name": "Vegetarian Pizza",
      "price": 8.00,
      "image": "assets/images/one.jpg",
      "is_favorite": false,
    },
    {
      "id": 2,
      "name": "Vegetarian Pizza",
      "price": 26.00,
      "image": "assets/images/two.jpg",
      "is_favorite": true,
    },
    {
      "id": 3,
      "name": "Vegetarian Pizza",
      "price": 15.00,
      "image": "assets/images/three.jpg",
      "is_favorite": false,
    },
  ];
  int categorySelected = 0;

  bool categoryIsSelected(int currentIdx, int idxSelected) {
    return currentIdx == idxSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        // leading: const Icon(null),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    delay: 1.0,
                    child: Text(
                      "Food Delivery",
                      style: TextStyle(
                        color: Colors.grey[80],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, idx) => FadeAnimation(
                        delay: 1,
                        // @todo 这里设置回调选中存在问题
                        child: GestureDetector(
                          onTap: () {
                            categorySelected = idx;
                          },
                          child: CardCategoryWidget(
                            title: categories[idx],
                            isActiveFn: () =>
                                categoryIsSelected(idx, categorySelected),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Free Delivery',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,
                  itemBuilder: (context, idx) => FadeAnimation(
                    delay: 1.4,
                    child: CardFoodWidget(
                      name: foods[idx]['name'],
                      price: foods[idx]['price'],
                      image: foods[idx]['image'],
                      isFavorite: foods[idx]['is_favorite'],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
