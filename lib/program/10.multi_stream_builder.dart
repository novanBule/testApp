import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Map<String, Color> itemColor = {
    "red": Colors.red,
    "amber": Colors.amber,
    "purple": Colors.purple,
    "blue": Colors.blue,
  };

  String textDisplay = '';
  String colorDisplay = 'red';

  ContainerBloc bloc = ContainerBloc();

  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
        stream: bloc.streamColor,
        initialData: itemColor['red'],
        builder: (context, snapshotColor) {
          return StreamBuilder(
            stream: bloc.streamText,
            initialData: textDisplay,
            builder: (context, snapshotText) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 150,
                    color: snapshotColor.data,
                    child: Center(
                      child: Text(
                        snapshotText.data,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            height: 65,
                            child: DropdownButton(
                              isExpanded: true,
                              onChanged: (value) {
                                bloc.sinkColor.add(itemColor[value]);
                                colorDisplay = value;
                              },
                              value: colorDisplay,
                              items: itemColor.keys.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: itemColor[e],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 5),
                            child: TextField(
                              controller: text,
                              onChanged: (value) {
                                bloc.sinkText.add(value);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      )),
    );
  }
}

class ContainerBloc {
  StreamController<String> _controllerText = StreamController();
  StreamSink<String> get sinkText => _controllerText.sink;
  Stream<String> get streamText => _controllerText.stream;

  StreamController<Color> _controllerColor = StreamController();
  StreamSink<Color> get sinkColor => _controllerColor.sink;
  Stream<Color> get streamColor => _controllerColor.stream;

  void dispose() {
    _controllerColor.close();
    _controllerText.close();
  }
}
