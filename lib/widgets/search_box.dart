import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool? enable;
  final VoidCallback? onTap;
  
  SearchBox({this.controller, this.hint, this.enable, this.onTap});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        child: TextField(
          enabled: widget.enable,
          controller: widget.controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(color: black_50),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              fillColor: gallery,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)))),
        ),
      ),
    );
  }
}
