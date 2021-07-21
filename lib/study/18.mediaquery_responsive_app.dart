import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      appBar: AppBar(
        title: Text("Media Query Responsive"),
        centerTitle: true,
      ),

      // body: Container(
      //   color: Colors.red,
      //   width: MediaQuery.of(context).size.width / 3,      // lebar 1/3
      //   height: MediaQuery.of(context).size.height / 2,    // tinggi 1/2
      // ),

      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? Column(
              children: generateContainers(),
            )
          : Row(
              children: generateContainers(),
            ),
    );
  }

  List<Widget> generateContainers() {
    return <Widget>[
      Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.orange,
        width: 100,
        height: 100,
      ),
    ];
  }
}
