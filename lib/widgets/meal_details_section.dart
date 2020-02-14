import 'package:flutter/material.dart';

class MealDetailsSection extends StatelessWidget {
  final Widget child;
  final Color color;

  const MealDetailsSection({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
