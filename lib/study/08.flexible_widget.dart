import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// flexible widget => abstract

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.purple,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
