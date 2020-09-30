import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constents.dart';

class cardcontent extends StatelessWidget {
  final String lable;
  final IconData icon;
  cardcontent({
    this.icon,
    this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, size: KIconsize),
        SizedBox(
          height: 15.0,
        ),
        Text(lable, style: KLabletextstyle),
      ],
    );
  }
}
