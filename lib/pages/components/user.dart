import 'package:flutter/material.dart';

class user extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const user({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Row(children: [
          Icon(Icons.person),
          const SizedBox(
            height: 20,
          ),
          Text(text)
        ]),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
