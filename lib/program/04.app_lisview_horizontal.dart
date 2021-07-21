import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

Widget createCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
    width: MediaQuery.of(context).size.width * 0.4,
    height: double.infinity,
    child: Card(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage("images/test_sunset.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "Lorem Ipsum",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Center(
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.deepPurple,
                        elevation: 3,
                        child: Icon(Icons.keyboard_arrow_down_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
            children: [
              Material(
                elevation: 4,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.purple[800]],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Image(
                            image: AssetImage("images/team.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Spacer(
                                flex: 10,
                              ),
                              Center(
                                child: Text(
                                  "Horizon",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: "Pacifico",
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "Solution for your Business",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Spacer(
                                flex: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[900], Colors.purple],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Hai, Novan!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.person_pin),
                                ),
                                Text(
                                  "Plan",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.book),
                                ),
                                Text(
                                  "History",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.work),
                                ),
                                Text(
                                  "Work",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.trending_up),
                                ),
                                Text(
                                  "Trending",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.business_center_rounded),
                                ),
                                Text(
                                  "Relation",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  elevation: 2,
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  onPressed: () {},
                                  child: Icon(Icons.travel_explore),
                                ),
                                Text(
                                  "Explore",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 7, right: 7, top: 2, bottom: 2),
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Benefit",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See more..",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [Colors.blue[800], Colors.purple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 1; i <= 10; i++) createCard(context)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
