import 'package:flutter/material.dart';
import 'package:travely/widget/app-text.dart';

import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  bool isIcon;
  String? text = "g";
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  AppButton(
      {super.key,
      this.isIcon = false,
      required this.size,
      required this.color,
      this.text,
      this.icon,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: Text(
              text!,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
