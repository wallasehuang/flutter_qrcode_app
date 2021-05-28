import 'package:flutter/material.dart';

import 'scan_page.dart';
// import 'report_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff4a4a4a),
      theme: ThemeData(fontFamily: 'creamfont'),
      home: ScanPage(),
      // home: ReportPage(list: [1, 2, 2, 2, 1, 2, 2, 4, 1, 1]),
      //  return ReportPage(list: _answers);
    );
  }
}
