import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

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
  String txt = "Kosong";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              txt,
              style: TextStyle(
                color: Colors.purple[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                txt = await scanner.scan();
                setState(() {});
              },
              child: Text("Scan"),
            ),
          ],
        ),
      ),
    );
  }
}
