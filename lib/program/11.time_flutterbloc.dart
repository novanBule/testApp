import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TimerBloc(0),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  int counter = 0;

  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    TimerBloc bloc = BlocProvider.of<TimerBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerBloc, int>(
              builder: (context, currentCounter) => Text(
                currentCounter.toString(),
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  isRunning = !isRunning;
                  counter = 0;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (isRunning) {
                      counter++;
                      print(counter);
                      bloc.add(counter);
                    } else {
                      timer.cancel();
                      counter = 0;
                      bloc.add(counter);
                    }
                  });
                },
                minWidth: double.infinity,
                height: double.infinity,
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  "Click",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerBloc extends Bloc<int, int> {
  int timer = 0;

  TimerBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    timer = event;

    yield timer;
  }
}
