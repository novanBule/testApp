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
  final TabBar myTabBar = TabBar(
    indicator: BoxDecoration(
      color: Colors.red,
      border: Border(
        top: BorderSide(color: Colors.purple, width: 5),
      ),
    ),
    // indicatorColor: Colors.red,
    // isScrollable: true,
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
    tabs: [
      Tab(
        icon: Icon(Icons.comment),
        text: "Comment",
      ),
      Tab(
        icon: Icon(Icons.computer),
        text: "Computer",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text("Contoh Tab Bar"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
            child: Container(
              color: Colors.amber,
              child: myTabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _createText("Text 1"),
            _createText("Text 2"),
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
