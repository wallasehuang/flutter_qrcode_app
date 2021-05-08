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
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background_report.jpg'),
                    fit: BoxFit.fill))),
        Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text("你的人格傾向",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEE7959),
                  )),
              ReportGird(),
              Button(
                text: "重新掃描",
                onPress: () {},
                textColor: 0xffffffff,
                backgroundColor: 0xffbbbbbb,
              ),
            ])),
      ],
    ));
  }
}

class ReportGird extends StatelessWidget {
  ReportGird();

  @override
  Widget build(BuildContext context) {
    final items = [
      _reportCard(img: 'images/SJ.png', title: '社群主義者', score: '50'),
      _reportCard(img: 'images/NT.png', title: '理性主義者', score: '50'),
      _reportCard(img: 'images/SP.png', title: '現實主義者', score: '50'),
      _reportCard(img: 'images/NF.png', title: '理想主義者', score: '50'),
    ];
    return Center(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [items[0], items[1]]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [items[2], items[3]]),
        ],
      ),
    );
  }

  Widget _reportCard({String img, String title, String score}) => Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
              width: 200.0,
              height: 200.0),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              )),
          Text('$score%',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000)))
        ],
      ));
}

class ReportItem {
  String img = '';
}
