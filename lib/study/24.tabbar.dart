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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text("Contoh Tab Bar"),
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
            tabs: [
              Tab(
                icon: Icon(Icons.comment),
                text: "Comment",
              ),
              Tab(
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("images/ig.png"),
                ),
              ),
              Tab(
                icon: Icon(Icons.computer),
              ),
              Tab(
                text: "News",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _createText("Text 1"),
            _createText("Text 2"),
            _createText("Text 3"),
            _createText("Text 4"),
          ],
        ),
      ),
    );
  }

  Widget _createText(String text) {
    return Center(
        child: Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
    ));
  }
}
