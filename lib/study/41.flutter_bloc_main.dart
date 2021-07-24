import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '41.flutter_bloc_zlib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(Colors.amber),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.to_light_blue);
            },
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("BLoC dengan flutter_bloc"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            duration: Duration(milliseconds: 500),
            color: currentColor,
          ),
        ),
      ),
    );
  }
}
