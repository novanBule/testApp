import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Add Data'),
                        onPressed: () {
                          setState(() {
                            widgets.add(Text("Data ke-" + counter.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )));
                          });
                          counter++;
                        }),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text('Delete Data'),
                        onPressed: () {
                          if (widgets.isNotEmpty) {
                            setState(() {
                              widgets.removeLast();
                            });
                            counter--;
                          }
                        }),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                        color: Colors.amber[800],
                        textColor: Colors.white,
                        child: Text('Reset Data'),
                        onPressed: () {
                          if (widgets.isNotEmpty) {
                            setState(() {
                              widgets.clear();
                            });
                            counter = 1;
                          }
                        }),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // data berubah disini
              children: (widgets.isNotEmpty)
                  ? widgets
                  : [
                      Center(
                          child: Text("Data Kosong",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.pink[400],
                              ))),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
