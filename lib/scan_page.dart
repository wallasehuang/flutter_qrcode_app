import 'package:flutter/material.dart';

import 'button.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("請分別掃描二維碼",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              Flexible(
                  child: ClipRRect(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: OverflowBox(
                      maxHeight: screenWidth,
                      maxWidth: screenWidth,
                      child: Container(
                        color: Colors.black,
                      )),
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(10, (index) => _dot(status: true)),
              ),
              Button(
                text: "重新掃描",
                onPress: () {},
              ),
              Button(
                text: "開始分析",
                onPress: () {},
              ),
            ]),
      ),
    );
  }
}

Widget _dot({@required status}) => Icon(Icons.circle,
    color: status ? Color.fromRGBO(238, 121, 89, 1) : Colors.white);
