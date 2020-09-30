import 'package:flutter/material.dart';
import './constents.dart';

class ButtomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  ButtomButton({this.onTap, this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: KBottomcontainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KBottomcontainerheight,
        child: Center(
            child: Text(
          text,
          style: KLargeButtonTextStyle,
        )),
      ),
    );
  }
}
