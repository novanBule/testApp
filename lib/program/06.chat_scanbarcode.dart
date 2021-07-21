import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}

List<String> listName = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Horizonn",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[900], Colors.blue[900]],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.chat_bubble),
              ),
              Tab(
                icon: Icon(Icons.qr_code_scanner),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/test_sunset.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: listName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.35),
                        height: 80,
                        child: Row(
                          children: [
                            Flexible(
                                flex: 4,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("images/bamboo.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Flexible(
                              flex: 16,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          listName[index],
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text("Kemarin"),
                                      ],
                                    ),
                                    Text("Lorem ipsum set ..."),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                Align(
                  alignment: Alignment(0.9, 0.9),
                  child: FloatingActionButton(
                    backgroundColor: Colors.purple[900],
                    elevation: 4,
                    onPressed: () {},
                    child: Icon(Icons.chat),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/test_sunset.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 4,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [Colors.purple[400], Colors.blue[900]],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.pink,
                              child: Center(
                                child: Text(
                                  "Scan Barcode",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                name = await scanner.scan();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 4,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [Colors.purple[400], Colors.blue[900]],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.pink,
                              child: Center(
                                child: Text(
                                  "Add to list",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    decoration: (name.isEmpty)
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                              onTap: (name.isEmpty)
                                  ? () {}
                                  : () {
                                      listName = List.from(listName)..add(name);
                                      name = "";
                                      setState(() {});
                                    },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
