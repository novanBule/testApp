import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MainScreen();
            }));
          },
        ),
      ),
    );
  }
}

// Main Screen
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Go to Second Screen"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondScreen();
            }));
          },
        ),
      ),
    );
  }
}

// Second Screen
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Back to Main Screen"),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return MainScreen();
            }));
          },
        ),
      ),
    );
  }
}
