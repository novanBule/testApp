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
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Connect Post Api"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "Tidak ada Data"),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("Bambang", "Presiden").then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({this.id, this.name, this.job, this.created});

  // membuat object dari mapping json object
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  // connect to api
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiResult =
        await http.post(Uri.parse(apiUrl), body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);
    return PostResult.createPostResult(jsonObject);
  }
}
