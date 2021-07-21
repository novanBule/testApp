import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

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
  double mypadding = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: AnimatedPadding(
                    padding: EdgeInsets.all(mypadding),
                    duration: Duration(seconds: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          mypadding = 20;
                        });
                      },
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: AnimatedPadding(
                    padding: EdgeInsets.all(mypadding),
                    duration: Duration(seconds: 5),
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: AnimatedPadding(
                    padding: EdgeInsets.all(mypadding),
                    duration: Duration(seconds: 5),
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: AnimatedPadding(
                    padding: EdgeInsets.all(mypadding),
                    duration: Duration(seconds: 5),
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
