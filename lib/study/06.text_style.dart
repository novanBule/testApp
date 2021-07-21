import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextStyle'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Ini adalah text',
            style: TextStyle(
              fontFamily: "NotoSansJP",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationThickness: 3,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),
      ),
    );
  }
}
