import 'package:flutter/material.dart';

class CardCategoryWidget extends StatelessWidget {
  final String title;
  final Function isActiveFn;

  const CardCategoryWidget({
    Key? key,
    required this.title,
    required this.isActiveFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 120,
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActiveFn() ? Colors.yellow[700] : Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: isActiveFn() ? Colors.black : Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
