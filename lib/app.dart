import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'scan_page.dart';

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key key, @required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff4a4a4a),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ScanPage(camera),
    );
  }
}
