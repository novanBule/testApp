import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = "Tidak ada data";
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Connect API GET"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((user != null)
                  ? user.id + " | " + user.name
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  User.connectToApi("10").then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text("GET DATA"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object["id"].toString(),
        name: object["first_name"] + " " + object["last_name"]);
  }

  static Future<User> connectToApi(String id) async {
    String url = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(Uri.parse(url));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
