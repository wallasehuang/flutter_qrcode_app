import 'package:flutter/material.dart';

import 'button.dart';
import 'report_page.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Text("請分別掃描二維碼",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500)),
          Container(color: Colors.black, height: 460, width: 460),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 10; i++) _dot(status: true),
            ],
          ),
          Button(
            text: "重新掃描",
            onPress: () {},
            textColor: 0xffffffff,
            backgroundColor: 0xffee7959,
          ),
          Button(
            text: "開始分析",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ReportPage();
              }));
            },
            textColor: 0xffffffff,
            backgroundColor: 0xffb6b14c,
          ),
        ])));
  }
}

Widget _dot({@required status}) => Icon(Icons.circle,
    color: status ? Color.fromRGBO(238, 121, 89, 1) : Colors.white);
