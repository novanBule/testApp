import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final int maxValue = 15;
  final double widthProgressBar = 200;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TestApp"),
          flexibleSpace: Consumer<TimerProvider>(
            builder: (context, timerProvider, _) => AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                color: (timerProvider.isStart)
                    ? Colors.red[900]
                    : Colors.purple[900],
              ),
            ),
          ),
        ),
        body: Center(
          child: Consumer<TimerProvider>(
            builder: (context, timeProvider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthProgressBar,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 3,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width:
                            widthProgressBar * (timeProvider.value / maxValue),
                        height: 10,
                        decoration: BoxDecoration(
                          color: (timeProvider.value <= 3)
                              ? Colors.red[900]
                              : (timeProvider.value <= 10)
                                  ? Colors.amber
                                  : Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: (timeProvider.isStart)
                      ? Colors.red[900]
                      : Colors.purple[900],
                  textColor: Colors.white,
                  onPressed: () {
                    timeProvider.isStart = !timeProvider.isStart;
                    Timer.periodic(Duration(seconds: 1), (timer) {
                      if (timeProvider.isStart) {
                        if (timeProvider.value < maxValue) {
                          timeProvider.value += 1;
                        } else {
                          timer.cancel();
                        }
                      } else {
                        if (timeProvider.value > 0) {
                          timeProvider.value -= 1;
                        } else {
                          timer.cancel();
                        }
                      }
                    });
                  },
                  child: Text((timeProvider.isStart) ? "Back" : "Start"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerProvider with ChangeNotifier {
  bool _isStart = false;
  int _value = 0;

  int get value => _value;

  set value(int val) {
    _value = val;
    notifyListeners();
  }

  bool get isStart => _isStart;

  set isStart(bool val) {
    _isStart = val;
    notifyListeners();
  }
}
