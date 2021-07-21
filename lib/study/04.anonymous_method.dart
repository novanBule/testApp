import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = "Tombol belum ditekan";

  // void tekanTombol() {
  //   setState(() {
  //     msg = "Tombol sudah ditekan";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Annonymous'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(msg),
              RaisedButton(
                  child: Text("Tekan Saya"),
                  onPressed: () {
                    setState(() {
                      msg = "Tombol sudah ditekan";
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
