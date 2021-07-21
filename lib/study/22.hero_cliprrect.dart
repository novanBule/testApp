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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Latihan Hero Animation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
        child: Hero(
          tag: 'profile',
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(50),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

            child: Container(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("images/jennie.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Latihan Hero Animation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'profile',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(20),
            //   topRight: Radius.circular(20),
            // ),

            child: Container(
              width: 200,
              height: 200,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("images/jennie.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
