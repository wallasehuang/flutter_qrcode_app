import 'package:flutter/material.dart';

import 'button.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text("你的人格傾向",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEE7959),
                )),
            ReportGird(),
            Button(),
          ])),
    );
  }
}

class ReportGird extends StatelessWidget {
  ReportGird();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_reportCard(), _reportCard()]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_reportCard(), _reportCard()]),
        ],
      ),
    );
  }

  Widget _reportCard({String img, String title, String score}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4)),
          color: Colors.black87,
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(25),
        width: 100,
        height: 100,
      );
}
