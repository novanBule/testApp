import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

// https://programmersought.com/article/27625147920/

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
  double _borderContainer = 20;
  double _widthContainer = 300;
  double _heightContainer = 150;
  Color _colorContainer = Colors.red;
  String _textContainer = "";

  TextEditingController _inputText = TextEditingController();
  TextEditingController _inputRadius = TextEditingController();

  Map<String, Color> _listColor = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Amber": Colors.amber,
    "Green": Colors.green,
    "Purple": Colors.purple,
  };

  List<String> _keyListColor = [];
  String _dropdownValue = "Red";

  initState() {
    _keyListColor = _listColor.keys.toList();
    super.initState();
  }

  Widget createWidget() {
    return Container(
      width: _widthContainer,
      height: _heightContainer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderContainer),
        color: _colorContainer,
      ),
      child: Center(
        child: Text(
          _textContainer,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "LobsterTwo",
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  void save() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble("borderContainer", _borderContainer);
    preferences.setString("textContainer", _textContainer);
    preferences.setString("colorContainer", _dropdownValue);
    // preferences.setDouble("widthContainer", _widthContainer);
    // preferences.setDouble("heightContainer", _heightContainer);
  }

  Future<String> getTextContainer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("textContainer") ?? "";
  }

  Future<double> getBorderContainer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble("borderContainer") ?? 0;
  }

  Future<String> getColorContainer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("colorContainer") ?? "Red";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shared Preferences",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "LobsterTwo",
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple[800], Colors.blue[800]],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createWidget(),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
                controller: _inputText,
                decoration: InputDecoration(
                  hintText: "Text",
                ),
                onChanged: (val) {
                  setState(() {
                    _textContainer = (val.isEmpty) ? "" : val;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
                controller: _inputRadius,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Radius",
                ),
                onChanged: (val) {
                  setState(() {
                    print(val.isEmpty);
                    _borderContainer = (val.isEmpty) ? 0 : double.parse(val);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: DropdownButton(
                value: _dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: _keyListColor.map((String e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(
                        color: _listColor[e],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                    _colorContainer = _listColor[_dropdownValue];
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                save();
                setState(() {});
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                getBorderContainer().then((value) {
                  _borderContainer = value;
                  setState(() {
                    createWidget();
                    _inputRadius.text = _borderContainer.toString();
                  });
                });
                getColorContainer().then((value) {
                  _dropdownValue = value;
                  _colorContainer = _listColor[_dropdownValue];
                  setState(() {
                    createWidget();
                  });
                });
                getTextContainer().then((value) {
                  _textContainer = value;
                  setState(() {
                    _inputText.text = _textContainer;
                    createWidget();
                  });
                });
                // Future.delayed(Duration(seconds: 3), () {
                //   _inputText.text = _textContainer;
                //   _inputRadius.text = _borderContainer.toString();
                //   createWidget();
                //   setState(() {
                //     print(_textContainer);
                //     print(_borderContainer);
                //   });
                // });
              },
              child: Text("Load"),
            ),
          ],
        ),
      ),
    );
  }
}
