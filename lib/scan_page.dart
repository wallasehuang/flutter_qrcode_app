import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';

import 'button.dart';
import 'report_page.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  QRCaptureController _captureController = QRCaptureController();
  List<int> _answers = List.generate(10, (index) => 0);
  String _qrcodeData = null;

  @override
  void initState() {
    super.initState();
    _captureController.onCapture((data) {
      _qrcodeData = data;
    });
  }

  @override
  void dispose() {
    _captureController.pause();
    super.dispose();
  }

  void _onScanButtonPressed() {
    try {
      int index = _answers.indexWhere((element) => element == 0);
      print(index);
      setState(() {
        _answers[index] = int.parse(_qrcodeData);
      });
    } catch (error) {
      print(error);
    } finally {
      _captureController.resume();
    }
  }

  void _onResetButtonPressed() {
    setState(() {
      _answers = _answers.map((x) => 0).toList();
    });
    _captureController.resume();
  }

  void _onParseButtonPressed() {
    _answers.forEach((element) => print(element));

    // TODO
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReportPage(list: _answers);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final qrcodeViewSize = screenSize.width * 0.6;

    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_main.png'),
                  fit: BoxFit.fill))),
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("請分別掃描二維碼",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              Container(
                color: Colors.black,
                height: qrcodeViewSize,
                width: qrcodeViewSize,
                child: QRCaptureView(controller: _captureController),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _answers.map((e) => _dot(status: e > 0)).toList(),
              ),
              Button(
                textColor: 0xffffffff,
                backgroundColor: 0xffee7959,
                text: "掃描",
                onPress: _onScanButtonPressed,
              ),
              Button(
                textColor: 0xffffffff,
                backgroundColor: 0xffee7959,
                text: "重新掃描",
                onPress: _onResetButtonPressed,
              ),
              Button(
                textColor: 0xffffffff,
                backgroundColor: 0xffb6b14c,
                text: "開始分析",
                onPress: _onParseButtonPressed,
              ),
            ]),
      ),
    ]));
  }
}

Widget _dot({@required status}) => Icon(Icons.circle,
    color: status ? Color.fromRGBO(238, 121, 89, 1) : Colors.grey);
