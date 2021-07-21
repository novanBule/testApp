import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

// https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Feature"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Contoh 01 (tanpa apapun)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Contoh 02 (Smal Caps)",
              style: TextStyle(fontSize: 20, fontFeatures: [
                FontFeature.enable("smcp"),
              ]),
            ),
            Text(
              "Contoh 1/2 (Smal Caps & Frac)",
              style: TextStyle(fontSize: 20, fontFeatures: [
                FontFeature.enable("smcp"),
                FontFeature.enable("frac"),
              ]),
            ),
            Text(
              "Contoh 19 LobsterTwo (old figure)",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "LobsterTwo",
                  fontFeatures: [
                    FontFeature.oldstyleFigures(),
                  ]),
            ),
            Text(
              "Contoh LobsterTwo (Stylicshet)",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "LobsterTwo",
                  fontFeatures: [
                    FontFeature.stylisticSet(1),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
