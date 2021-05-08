import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  Button({this.text = 'a', this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Color(0xffffffff),
            backgroundColor: Color(0xffEE7959),
            padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(72.0))),
        child: Text(text),
        onPressed: onPress);
  }
}
