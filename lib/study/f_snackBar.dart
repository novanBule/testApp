import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SnackBar",
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar"),
          centerTitle: true,
        ),
        body: SnackBarApp(),
      ),
    );
  }
}

class SnackBarApp extends StatefulWidget {
  @override
  _SnackBarAppState createState() => _SnackBarAppState();
}

class _SnackBarAppState extends State<SnackBarApp> {
  String status = "Click Me";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(status),
        onPressed: () {
          setState(() {
            status = "Done !!";
          });

          final snackBar = SnackBar(
              content: Text("Yes, I clicked this"),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  setState(() {
                    status = "Click Me";
                  });
                },
              ));

          Scaffold.of(context)
              .showSnackBar(snackBar)
              .closed
              .then((SnackBarClosedReason reason) {
            // print(reason);
            setState(() {
              status = "Click Me";
            });
          });
        },
      ),
    );
  }
}
