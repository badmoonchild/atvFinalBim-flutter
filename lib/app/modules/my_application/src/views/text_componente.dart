import 'package:flutter/material.dart';

class TextComponente extends StatelessWidget {

  String message;
  bool bold;
  double fontSize;

  TextComponente(
      {super.key,
        required this.message,
        required this.bold,
        required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Text( message,
          style: TextStyle(
            fontWeight: bold? FontWeight.bold :FontWeight.normal ,
            fontSize: fontSize,
          ),
        ),
      );
  }
}
