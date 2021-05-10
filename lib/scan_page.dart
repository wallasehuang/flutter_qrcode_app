import 'package:flutter/material.dart';

import 'button.dart';
import 'report_page.dart';

class ScanPage extends StatefulWidget {
  // final CameraDescription camera;

  // ScanPage(@required this.camera, {Key key}) : super(key: key);

  ScanPage();

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with WidgetsBindingObserver {
  // CameraController cameraController;
  // Future<void> _cameraInitializeFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  //   // resetCamera(widget.camera);
  // }

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   stopCameraResources();
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return;
  //   }
  //   switch (state) {
  //     case AppLifecycleState.paused:
  //       stopCameraResources();
  //       break;
  //     case AppLifecycleState.resumed:
  //       resetCamera(widget.camera);
  //       break;
  //     case AppLifecycleState.inactive:
  //     case AppLifecycleState.detached:
  //       break;
  //   }
  // }

  // void resetCamera(CameraDescription cameraDescription) async {
  //   if (cameraController != null) {
  //     await cameraController?.dispose();
  //   }

  //   cameraController = CameraController(
  //     cameraDescription,
  //     ResolutionPreset.veryHigh,
  //     enableAudio: false,
  //     imageFormatGroup: ImageFormatGroup.jpeg,
  //   );
  //   cameraController.addListener(() {
  //     if (mounted) setState(() {});
  //     if (cameraController.value.hasError) {
  //       print('Camera error ${cameraController.value.errorDescription}');
  //     }
  //   });

  //   _cameraInitializeFuture = cameraController.initialize();

  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  // void stopCameraResources() async {
  //   if (cameraController == null) {
  //     return;
  //   }
  //   await cameraController?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

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
              // Flexible(
              //   child: FutureBuilder(
              //     future: _cameraInitializeFuture,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done &&
              //           cameraController.value.isInitialized) {
              //         // camera preview params
              //         final screenH = math.max(screenHeight, screenWidth);
              //         final screenW = math.min(screenHeight, screenWidth);
              //         final tmp = cameraController.value.previewSize;
              //         final previewH = math.max(tmp.height, tmp.width);
              //         final previewW = math.min(tmp.height, tmp.width);
              //         final screenRatio = screenH / screenW;
              //         final previewRatio = previewH / previewW;

              //         return ClipRRect(
              //           child: AspectRatio(
              //             aspectRatio: 1,
              //             child: OverflowBox(
              //                 maxHeight: screenRatio > previewRatio
              //                     ? screenH
              //                     : screenW / previewW * previewH,
              //                 maxWidth: screenRatio > previewRatio
              //                     ? screenH / previewH * previewW
              //                     : screenW,
              //                 child: CameraPreview(cameraController)),
              //           ),
              //         );
              //       } else {
              //         return AspectRatio(
              //             aspectRatio: 1,
              //             child: Container(
              //                 alignment: Alignment.center,
              //                 color: Colors.grey,
              //                 child: CircularProgressIndicator()));
              //       }
              //     },
              //   ),
              // ),
              Container(color: Colors.black, width: 400.0, height: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(10, (index) => _dot(status: true)),
              ),
              Button(
                textColor: 0xffffffff,
                backgroundColor: 0xffee7959,
                text: "重新掃描",
                onPress: () {},
              ),
              Button(
                textColor: 0xffffffff,
                backgroundColor: 0xffb6b14c,
                text: "開始分析",
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ReportPage();
                  }));
                },
              ),
            ]),
      ),
    ]));
  }
}

Widget _dot({@required status}) => Icon(Icons.circle,
    color: status ? Color.fromRGBO(238, 121, 89, 1) : Colors.white);
