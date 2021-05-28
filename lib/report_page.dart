import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'button.dart';

class ReportPage extends StatelessWidget {
  final List<int> list;

  const ReportPage({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_report.jpg'),
                    fit: BoxFit.fill))),
        Container(
          color: Color.fromRGBO(223, 223, 223, .5),
          height: 462,
          width: 462,
          // child: QRCaptureView(controller: _captureController),
        ),
        Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text("你的人格傾向",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'creamfont',
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEE7959),
                  )),
              ReportGird(list: list),
              Button(
                text: "重新掃描",
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: 0xffffffff,
                backgroundColor: 0xffee7959,
              ),
            ])),
      ],
    ));
  }
}

class ReportGird extends StatelessWidget {
  final List<int> list;

  ReportGird({@required this.list});

  @override
  Widget build(BuildContext context) {
    final items = [
      _reportCard(
          img: 'assets/images/SJ.png',
          title: '社群主義者',
          score: '${_filterListCount(1) * 10}'),
      _reportCard(
          img: 'assets/images/NT.png',
          title: '理性主義者',
          score: '${_filterListCount(2) * 10}'),
      _reportCard(
          img: 'assets/images/SP.png',
          title: '現實主義者',
          score: '${_filterListCount(3) * 10}'),
      _reportCard(
          img: 'assets/images/NF.png',
          title: '理想主義者',
          score: '${_filterListCount(4) * 10}'),
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
          borderRadius: const BorderRadius.all(const Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 13,
                offset: Offset(6, 9))
          ]),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(25),
      child: Stack(children: [
        if (score == _maxScore())
          Align(
              alignment: Alignment.topRight,
              child: Icon(FontAwesomeIcons.crown)),
        Column(children: [
          Container(
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
              width: 250.0,
              height: 250.0),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              )),
          Text('$score%',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000)))
        ])
      ]));

  int _filterListCount(int val) {
    int count = 0;

    list.forEach((item) => item == val ? count++ : 0);

    return count;
  }

  String _maxScore() {
    final result = [
      _filterListCount(1),
      _filterListCount(2),
      _filterListCount(3),
      _filterListCount(4)
    ].reduce(max);

    return '${result * 10}';
  }
}
