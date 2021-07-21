import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          version: 6,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.deepPurple,
          errorCorrectionLevel: QrErrorCorrectLevel.M,
          padding: EdgeInsets.all(10),
          size: 300,
          data:
              "https://www.youtube.com/watch?v=7CFAEXymRvM&list=PLZQbl9Jhl-VACm40h5t6QMDB92WlopQmV&index=30",
        ),
      ),
    );
  }
}
