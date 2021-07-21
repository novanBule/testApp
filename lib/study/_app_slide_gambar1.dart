import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  List<String> listGambar = ["gatotkaca.jpg", "ironman.jpg", "natalia.jpg"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage("images/" + listGambar[index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: RaisedButton(
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          child: Text("Prev"),
                          onPressed: (index <= 0)
                              ? null
                              : () {
                                  setState(() {
                                    index--;
                                  });
                                },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: RaisedButton(
                          color: Colors.purple,
                          textColor: Colors.white,
                          child: Text("Next"),
                          onPressed: (index >= listGambar.length - 1)
                              ? null
                              : () {
                                  setState(() {
                                    index++;
                                  });
                                },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
