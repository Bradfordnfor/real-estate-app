import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  MyText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? TextStyle()).copyWith(
          decoration: TextDecoration.none,
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w700),
    );
  }
}

class MyText2 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  MyText2(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? TextStyle()).copyWith(
          decoration: TextDecoration.none,
          fontSize: 12,
          fontWeight: FontWeight.w500),
    );
  }
}
