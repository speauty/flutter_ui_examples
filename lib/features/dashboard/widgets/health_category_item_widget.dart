import 'package:flutter/material.dart';

class HealthCategoryItemWidget extends StatelessWidget {
  const HealthCategoryItemWidget({
    Key? key,
    required this.name,
    required this.isLast,
  }) : super(key: key);

  final String name;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(bottom: BorderSide(color: Colors.grey.withOpacity(.1)))),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
