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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  TextEditingController controller = TextEditingController(text: "No Name");
  bool isOn = false;

  void saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("ison", isOn);
    sharedPreferences.setString("nama", controller.text);
  }

  Future<String> getNama() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("nama") ?? "No name";
  }

  Future<bool> getOn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("ison");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
            ),
            Switch(
              value: isOn,
              onChanged: (newValue) {
                setState(() {
                  isOn = newValue;
                  print(isOn);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                getOn().then((newValue) {
                  isOn = newValue;
                  setState(() {});
                });

                getNama().then((newValue) {
                  controller.text = newValue;
                  setState(() {});
                });
              },
              child: Text("Load"),
            ),
          ],
        ),
      ),
    );
  }
}
