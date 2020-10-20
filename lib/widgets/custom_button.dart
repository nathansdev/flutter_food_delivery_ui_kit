import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const AppButton(
      {this.text,
      this.fontSize,
      this.textColor,
      this.bgColor,
      this.fontWeight,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }
}
