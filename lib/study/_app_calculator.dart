import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List createList(String display) {
  List operator = ["+", "-", "/", "x"];

  var tmp = "";

  List displayList = display.split("");
  List tmpList = [];

  for (var i in displayList) {
    if (operator.contains(i)) {
      tmpList.add(tmp);
      tmpList.add(i);
      tmp = "";
    } else {
      tmp += i;
    }
  }

  if (tmp.isNotEmpty) {
    tmpList.add(tmp);
  }

  return tmpList;
}

bool canCalculate(String display) {
  bool status = false;

  List tmpList = createList(display);

  if (tmpList.length % 2 != 0) {
    if (tmpList.length != 1) {
      status = true;
      print("can calculate");
    }
  }

  print(tmpList);

  return status;
}

double calculateOperator(String n1, String o, String n2) {
  double result;

  if (o == "x") {
    result = double.parse(n1) * double.parse(n2);
  }

  if (o == "/") {
    result = double.parse(n1) / double.parse(n2);
  }

  if (o == "-") {
    result = double.parse(n1) - double.parse(n2);
  }

  if (o == "+") {
    result = double.parse(n1) + double.parse(n2);
  }

  return result;
}

double calculateResult(String display) {
  double result = 0;

  List displayList = createList(display);

  Map operator = {
    "+": {
      "count": 0,
      "index": [],
    },
    "-": {
      "count": 0,
      "index": [],
    },
    "/": {
      "count": 0,
      "index": [],
    },
    "x": {
      "count": 0,
      "index": [],
    },
  };

  for (int i = 0; i < displayList.length; i++) {
    if (displayList[i] == "x") {
      operator["x"]["count"] += 1;
      operator["x"]["index"].add(i);
    }

    if (displayList[i] == "/") {
      operator["/"]["count"] += 1;
      operator["/"]["index"].add(i);
    }

    if (displayList[i] == "+") {
      operator["+"]["count"] += 1;
      operator["+"]["index"].add(i);
    }

    if (displayList[i] == "-") {
      operator["-"]["count"] += 1;
      operator["-"]["index"].add(i);
    }
  }

  if (operator["x"]["count"] != 0 || operator["/"]["count"] != 0) {
    List indexPriority = [];
    List displayListCopy = displayList;
    for (var i in operator["x"]["index"]) {
      indexPriority.add(i);
    }

    for (var i in operator["/"]["index"]) {
      indexPriority.add(i);
    }
    indexPriority.sort();
    double tmp;

    int count = 1;

    bool onlyKaliBagi = false;
    if (operator["+"]["count"] == 0 && operator["-"]["count"] == 0) {
      onlyKaliBagi = true;
      print("onlyKaliBagi");
    }

    if (onlyKaliBagi) {
      int operandIndex = 1;

      for (int i = 1;
          i <= operator["/"]["count"] + operator["x"]["count"];
          i++) {
        if (i == 1) {
          tmp = calculateOperator(displayListCopy[operandIndex - 1],
              displayListCopy[operandIndex], displayListCopy[operandIndex + 1]);
          operandIndex += 2;
        } else {
          tmp = calculateOperator(tmp.toString(), displayListCopy[operandIndex],
              displayListCopy[operandIndex + 1]);
          operandIndex += 2;
        }
      }

      result = tmp;
      return result;
    }

    while (indexPriority.isNotEmpty) {
      tmp = calculateOperator(
          displayListCopy[indexPriority[0] - 1],
          displayListCopy[indexPriority[0]],
          displayListCopy[indexPriority[0] + 1]);

      displayListCopy.removeRange(indexPriority[0] - 1, indexPriority[0] + 2);

      displayListCopy.insert(indexPriority[0] - 1, tmp.toString());
      indexPriority.removeAt(0);
      if (indexPriority.isNotEmpty) {
        indexPriority[0] = indexPriority[0] - 2 * count;
      }
      count++;
    }

    int operandIndex = 1;

    for (int i = 1; i <= operator["+"]["count"] + operator["-"]["count"]; i++) {
      if (i == 1) {
        tmp = calculateOperator(displayListCopy[operandIndex - 1],
            displayListCopy[operandIndex], displayListCopy[operandIndex + 1]);
        operandIndex += 2;
      } else {
        tmp = calculateOperator(tmp.toString(), displayListCopy[operandIndex],
            displayListCopy[operandIndex + 1]);
        operandIndex += 2;
      }
    }

    result = tmp;
    return result;
  } else {
    int operandIndex = 1;

    double tmp = 0;

    List displayListCopy = displayList;

    for (int i = 1; i <= operator["+"]["count"] + operator["-"]["count"]; i++) {
      if (i == 1) {
        tmp = calculateOperator(displayListCopy[operandIndex - 1],
            displayListCopy[operandIndex], displayListCopy[operandIndex + 1]);
        operandIndex += 2;
      } else {
        tmp = calculateOperator(tmp.toString(), displayListCopy[operandIndex],
            displayListCopy[operandIndex + 1]);
        operandIndex += 2;
      }
    }

    result = tmp;
    return result;
  }
}

String displayIntDouble(String num) {
  String result = "";

  List tmp = num.split("");
  int index = 0;
  print(tmp);
  for (int i = 0; i < tmp.length; i++) {
    if (tmp[i] == ".") {
      index = i;
    }
  }
  print(index);
  print(index + 1);

  bool canInteger = true;
  for (int i = index + 1; i < tmp.length; i++) {
    if (tmp[i] != "0") {
      canInteger = false;
    }
  }

  if (index != 0) {
    if (canInteger) {
      result = num.substring(0, index);
    } else {
      result = num;
    }
  } else {
    result = num;
  }

  return result;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String displayNumber = "";
  double result = 0;

  Widget createOperator(String operator) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(3),
        width: double.infinity,
        height: double.infinity,
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              setState(() {
                if (displayNumber.isNotEmpty) {
                  if (operator != "=") {
                    if (!displayNumber.endsWith("+") &&
                        !displayNumber.endsWith("-") &&
                        !displayNumber.endsWith("/") &&
                        !displayNumber.endsWith("x")) {
                      displayNumber += operator;
                    }
                  } else {
                    if (createList(displayNumber).length == 1) {
                      result = double.parse(displayNumber);
                    } else {
                      result = calculateResult(displayNumber);
                      displayNumber = "";
                    }
                  }
                }
              });
            },
            child: Text(
              operator,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createNumber(String num) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(3),
        width: double.infinity,
        height: double.infinity,
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.deepPurple[900],
            onPressed: () {
              setState(() {
                // List tmpList = createList(dsp);

                if (num == "del") {
                  if (displayNumber != null && displayNumber.length > 0) {
                    displayNumber =
                        displayNumber.substring(0, displayNumber.length - 1);
                  } else {
                    displayNumber = "";
                  }
                } else if (num == ".") {
                  if (displayNumber != "") {
                    if (!displayNumber.endsWith("+") &&
                        !displayNumber.endsWith("-") &&
                        !displayNumber.endsWith("/") &&
                        !displayNumber.endsWith("x") &&
                        !displayNumber.endsWith(".")) {
                      int count =
                          ".".allMatches(createList(displayNumber).last).length;

                      if (count < 1) {
                        displayNumber += num;
                      }
                    }
                  }
                } else {
                  if (displayNumber.isEmpty) {
                    displayNumber = num;
                  } else {
                    displayNumber += num;
                  }
                }

                if (canCalculate(displayNumber)) {
                  result = calculateResult(displayNumber);
                  print(result);
                }

                print(displayNumber);
              });
            },
            child: Text(
              num,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // ================ atas ================
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  // atas 1
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.deepPurple]),
                      ),
                      child: Align(
                        alignment: Alignment(0.8, 0.8),
                        child: Text(
                          displayNumber,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // atas 2
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.deepPurple]),
                      ),
                      child: Align(
                        alignment: Alignment(0.8, 0.8),
                        child: Text(
                          displayIntDouble(result.toString()),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // =============== bawah ================
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  // number
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        // num 1-3
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              createNumber("1"),
                              createNumber("2"),
                              createNumber("3"),
                            ],
                          ),
                        ),

                        // num 4-6
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              createNumber("4"),
                              createNumber("5"),
                              createNumber("6"),
                            ],
                          ),
                        ),

                        // num 7-9
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              createNumber("7"),
                              createNumber("8"),
                              createNumber("9"),
                            ],
                          ),
                        ),

                        // del, 0, .
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              createNumber("del"),
                              createNumber("0"),
                              createNumber("."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // operator
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.red,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          createOperator("+"),
                          createOperator("-"),
                          createOperator("x"),
                          createOperator("/"),
                          createOperator("="),
                        ],
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
