import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStop = true;
  int counter = 0;
  bool isPurple = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                color: isPurple ? Colors.purple[900] : Colors.red[900],
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isPurple = !isPurple;
                    });
                  });
                },
                minWidth: double.infinity,
                height: double.infinity,
                color: Colors.purple[900],
                textColor: Colors.white,
                child: Text("Ubah Warna Langsung"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  Timer(Duration(seconds: 5), () {
                    setState(() {
                      isPurple = !isPurple;
                    });
                  });
                },
                minWidth: double.infinity,
                height: double.infinity,
                color: Colors.purple[900],
                textColor: Colors.white,
                child: Text("Ubah Warna 5 Detik"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  counter = 0;
                  isStop = false;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (isStop) timer.cancel();
                    setState(() {
                      counter++;
                    });
                  });
                },
                minWidth: double.infinity,
                height: double.infinity,
                color: Colors.red[900],
                textColor: Colors.white,
                child: Text("Start Timer"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  isStop = true;
                },
                minWidth: double.infinity,
                height: double.infinity,
                color: Colors.red[900],
                textColor: Colors.white,
                child: Text("Stop Timer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
