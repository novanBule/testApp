import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.adb,
            color: Colors.white,
          ),
          title: Text(
            "AppBar Example",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0096ff),
                  Color(0xff6610f2),
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("images/pattern2.png"),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
