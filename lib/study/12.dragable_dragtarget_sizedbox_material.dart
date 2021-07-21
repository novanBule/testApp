import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.purple;
  Color targetColor;
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dragable"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Draggable<Color>(
                  data: color1,
                  // untuk membungkus widget yang tidak mempunyai width dan height
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1,
                      shape: StadiumBorder(),
                      elevation: 3,
                    ),
                  ),

                  // tempat asli ketika object didrag
                  childWhenDragging: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.grey,
                      shape: StadiumBorder(),
                      elevation: 0,
                    ),
                  ),

                  // bentuk lingkaran ketika didrag
                  feedback: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color1.withOpacity(0.7),
                      shape: StadiumBorder(),
                      elevation: 3,
                    ),
                  ),
                ),
                Draggable<Color>(
                  data: color2,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2,
                      shape: StadiumBorder(),
                      elevation: 3,
                    ),
                  ),

                  // color2
                  childWhenDragging: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: Colors.grey,
                      shape: StadiumBorder(),
                      elevation: 0,
                    ),
                  ),

                  // color2
                  feedback: SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      color: color2.withOpacity(0.7),
                      shape: StadiumBorder(),
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
            DragTarget<Color>(
              // check data yang diterima
              onWillAccept: (value) => true,
              // jika sudah diterima
              onAccept: (value) {
                isAccepted = true;
                targetColor = value;
              },
              builder: (context, candidates, rejected) {
                return (isAccepted)
                    ? SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: targetColor,
                          shape: StadiumBorder(),
                        ),
                      )
                    : SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: Colors.black26,
                          shape: StadiumBorder(),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
