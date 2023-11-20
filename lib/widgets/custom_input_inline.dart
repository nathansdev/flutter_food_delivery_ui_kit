import 'package:flutter/material.dart';

class AppInputTextInline extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool? enable;

  const AppInputTextInline({Key? key, this.controller, this.hint, this.enable})
      : super(key: key);

  @override
  _AppInputTextInlineState createState() => _AppInputTextInlineState();
}

class _AppInputTextInlineState extends State<AppInputTextInline> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enable,
      controller: widget.controller,
    );
  }
}
