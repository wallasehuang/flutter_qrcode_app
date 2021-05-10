import 'package:first_app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final cameras = await availableCameras();

//   runApp(MyApp(
//     camera: cameras.isNotEmpty ? cameras.first : null,
//   ));

  runApp(MyApp());
}
