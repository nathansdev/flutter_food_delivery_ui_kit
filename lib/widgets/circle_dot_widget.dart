import 'package:flutter/cupertino.dart';

class CircleDotWidget extends StatelessWidget {
  final bool? isActive;
  final Color? color;
  final Color? borderColor;

  const CircleDotWidget({Key? key, this.isActive, this.color, this.borderColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive! ? 14 : 10,
      width: isActive! ? 14 : 10,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: borderColor!),
          color: color,
          shape: BoxShape.circle),
    );
  }
}
