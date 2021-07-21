import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.purple[900],
          minWidth: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FirstPage("Awesome");
            }));
          },
          child: Text(
            "Next Page",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  final String txt;
  FirstPage(this.txt);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[900],
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 200, 0, 0),
          child: Title(widget.txt),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String text;
  Title(this.text);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontFamily: "LobsterTwo",
          fontWeight: FontWeight.bold,
        ),
      ),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: _val * 100, left: _val * 90),
            child: child,
          ),
        );
      },
    );
  }
}
