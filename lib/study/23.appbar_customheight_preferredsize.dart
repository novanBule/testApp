import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:math';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        // from height
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.amber,
          flexibleSpace: Positioned(
            // positioned terbatas parent widget
            bottom: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Appbar with Custom Height",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
