import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: Colors.purple,
            width: 200,
            height: 200,
            padding: EdgeInsets.all(10),
            child: Image(
              // image: NetworkImage(
              //   "https://camo.githubusercontent.com/888e388801f947dec7c3d843942c277af25fe2b1aed1821542c4e711f210312a/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f7468756d622f632f63332f507974686f6e2d6c6f676f2d6e6f746578742e7376672f37363870782d507974686f6e2d6c6f676f2d6e6f746578742e7376672e706e67",
              // ),
              image: AssetImage("images/ironman.jpg"),
              fit: BoxFit.contain,
              // repeat: ImageRepeat.repeat,
            ),
          ),
        ),
      ),
    );
  }
}
