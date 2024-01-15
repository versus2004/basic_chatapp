import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  void Function()? onTap;
  final String text1;
  mybutton({super.key, required this.onTap, required this.text1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Color.fromRGBO(70, 130, 180, 0.8),
            borderRadius: BorderRadius.circular(12 )),
        child: Center(child: Text(text1)),
      ),
    );
  }
}
