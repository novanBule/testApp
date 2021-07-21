import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Button Gradasi"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: RaisedButton(
                color: Colors.amber,
                child: Text("Click Me"),
                onPressed: () {},
                shape: StadiumBorder(),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 3,
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  // efek pas ditekan, ink keliatan pas ditaro dimaterial
                  child: InkWell(
                    splashColor: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Center(
                        child: Text(
                      "Click Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
