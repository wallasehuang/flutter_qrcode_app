import 'package:flutter/material.dart';

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
              ReportGird(list: list),
              Button(
                text: "重新掃描",
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: 0xffffffff,
                backgroundColor: 0xffbbbbbb,
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
              width: 150.0,
              height: 150.0),
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

  int _filterListCount(int val) {
    int count = 0;

    list.forEach((item) => item == val ? count++ : 0);

    return count;
  }
}
