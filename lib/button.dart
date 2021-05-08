import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;
  final int textColor;
  final int backgroundColor;

  Button(
      {this.text,
      this.onPress,
      this.textColor = 0xffffffff,
      this.backgroundColor = 0xffEE7959});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Color(textColor),
            backgroundColor: Color(backgroundColor),
            padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(72.0))),
        child: Text(text),
        onPressed: onPress);
  }
}
