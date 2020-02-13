import 'package:flutter/material.dart';

class MealDetailsTitle extends StatelessWidget {
  final String title;
  final Icon icon;

  const MealDetailsTitle({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: 10,
          ),
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 25,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
