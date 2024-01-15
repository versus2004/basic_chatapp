import 'package:flutter/material.dart';

class realtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscuretext;
  const realtextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Color.fromRGBO(230, 247, 255, 0.8),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.8))),
    );
  }
}
