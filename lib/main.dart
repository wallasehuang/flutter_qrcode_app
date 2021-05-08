import 'package:first_app/scan_page.dart';
import 'package:flutter/material.dart';

import 'scan_page.dart';
// import 'report_page.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    "a".runtimeType;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff4a4a4a),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ScanPage(),
    );
  }
}
