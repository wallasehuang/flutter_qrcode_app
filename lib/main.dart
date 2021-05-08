import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff4a4a4a),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text("請分別掃描二維碼",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500)),
          Container(color: Colors.black, height: 460, width: 460),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 10; i++) Dot(status: true),
            ],
          ),
          Button(
            text: "重新掃描",
            onPress: () {},
          ),
          Button(
            text: "開始分析",
            onPress: () {},
          ),
        ]));
  }
}

// Dot widget
class Dot extends StatelessWidget {
  Dot({@required this.status});

  // final index;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.circle,
        color: status ? Color.fromRGBO(238, 121, 89, 1) : Colors.white);
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  Button({@required this.text, @required this.onPress});

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

// ====

class ReportPage extends StatefulWidget {
  ReportPage({Key key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text("你的人格傾向",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w500,
            color: Color(0xffEE7959),
          )),
    ]));
  }
}
