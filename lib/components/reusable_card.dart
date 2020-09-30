import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  Reusablecard({@required this.color, this.cardChild, this.onPressed});
  final Color color;
  final Widget cardChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
      ),
    );
  }
}
