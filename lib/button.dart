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
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: TextButton(
          style: TextButton.styleFrom(
              minimumSize: Size(270, 100),
              primary: Color(textColor),
              backgroundColor: Color(backgroundColor),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(72.0))),
          child: Text(text, style: TextStyle(fontSize: 36)),
          onPressed: onPress),
    );
  }
}
