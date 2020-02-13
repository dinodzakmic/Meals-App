import 'package:flutter/material.dart';

class MealDetailsSection extends StatelessWidget {
  final Widget child;
  final Color color;

  const MealDetailsSection({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
