import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;

  const AppText(
      {Key? key, this.text, this.size, this.weight, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
