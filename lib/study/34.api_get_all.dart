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
  String output = "no data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(output),
              ElevatedButton(
                onPressed: () {
                  User.getUsers("10").then((users) {
                    output = "";
                    for (int i = 0; i < users.length; i++) {
                      output = output + "[ " + users[i].name + " ] ";
                    }
                  });
                },
                child: Text("Get All Data"),
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

  static Future<List<User>> getUsers(String page) async {
    String url = "https://reqres.in/api/users?page=" + page;
    var apiResult = await http.get(Uri.parse(url));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)["data"];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }

    return users;
  }
}
