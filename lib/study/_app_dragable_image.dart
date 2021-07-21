import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final imagePath = "images/natalia.jpg";
  bool isAccepted = false;
  String imagePathVar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dragable"),
        ),
        body: Column(
          children: [
            // flexible atas
            Flexible(
              flex: 1,
              child: Row(
                // row atas
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blue,
                      padding: EdgeInsets.all(5),
                      child: Draggable<String>(
                        child: Image(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fill,
                        ),
                        feedback: Image(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.colorBurn,
                          width: 170,
                          height: 250,
                        ),
                        data: imagePath,
                        childWhenDragging: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              "Serius Dong",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.red,
                      padding: EdgeInsets.all(5),
                      child: DragTarget<String>(
                        onWillAccept: (value) => true,
                        onAccept: (value) {
                          isAccepted = true;
                          imagePathVar = value;
                        },
                        builder: (context, candidates, rejected) {
                          return (isAccepted)
                              ? Image(
                                  image: AssetImage(imagePathVar),
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "No Images",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // flexible bawah
            Flexible(
              flex: 1,
              child: Row(
                // row atas
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.purple,
                      padding: EdgeInsets.all(5),
                      child: DragTarget<String>(
                        onWillAccept: (value) => true,
                        onAccept: (value) {
                          isAccepted = true;
                          imagePathVar = value;
                        },
                        builder: (context, candidates, rejected) {
                          return (isAccepted)
                              ? Image(
                                  image: AssetImage(imagePathVar),
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "No Images",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ));
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.yellow,
                      padding: EdgeInsets.all(5),
                      child: DragTarget<String>(
                        onWillAccept: (value) => true,
                        onAccept: (value) {
                          isAccepted = true;
                          imagePathVar = value;
                        },
                        builder: (context, candidates, rejected) {
                          return (isAccepted)
                              ? Image(
                                  image: AssetImage(imagePathVar),
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "No Images",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
