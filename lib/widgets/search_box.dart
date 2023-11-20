import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool? enable;
  final VoidCallback? onTap;

  const SearchBox(
      {Key? key, this.controller, this.hint, this.enable, this.onTap})
      : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 60,
        child: TextField(
          enabled: widget.enable,
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: black_50),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              fillColor: gallery,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)))),
        ),
      ),
    );
  }
}
