import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = false;

  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(color: Colors.black, width: 3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Switcher"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(seconds: 1),
                // transitionBuilder: (child, animation) =>
                //     ScaleTransition(scale: animation, child: child),
                transitionBuilder: (child, animation) =>
                    RotationTransition(turns: animation, child: child),
              ),
              Switch(
                value: isOn,
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red[200],
                onChanged: (newValue) {
                  isOn = newValue;
                  print(newValue);
                  setState(() {
                    if (isOn) {
                      myWidget = Container(
                        key: ValueKey(1),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      );

                      // myWidget = SizedBox(
                      //   width: 200,
                      //   height: 100,
                      //   child: Center(
                      //     child: Text("Novan Prastyo",
                      //         style: TextStyle(
                      //             color: Colors.green,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 20)),
                      //   ),
                      // );

                    } else {
                      myWidget = Container(
                        key: ValueKey(2),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
