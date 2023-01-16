import 'package:flutter/material.dart';
import 'package:travely/utils/colors.dart';
import 'package:travely/widget/app-text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  String? text = 'hi';
  double? width;
  ResponsiveButton(
      {super.key, this.text, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: text!,
            color: Colors.white,
          ),
          Image.asset('img/button-one.png')
        ],
      ),
    );
  }
}
