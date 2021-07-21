import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Field"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                // password
                //obscureText: true,
                maxLength: 5,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,

                // decoration
                decoration: InputDecoration(
                  // icon diluar border
                  icon: Icon(Icons.ac_unit),

                  // warna text field
                  fillColor: Colors.blueGrey[100],
                  filled: true,

                  // prefix -> perfixText tidak boleh
                  // prefix: <Widget>

                  // icon didalam depan
                  prefixIcon: Icon(Icons.person),
                  // text didalam depan
                  prefixText: "Name : ",
                  // text perfix style
                  prefixStyle: TextStyle(color: Colors.red),

                  // keterangan diatas
                  labelText: "Nama Lengkap",
                  // labelStyle

                  // hint
                  hintText: "Nama lengkapnya Lho",
                  // hintStyle

                  // suffix -> bagian belakang

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}

// https://stackoverflow.com/questions/50122394/not-able-to-change-textfield-border-color
// https://owenhalliday.co.uk/shadows/
