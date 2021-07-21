// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:faker/faker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MyApp());
  });
}

var faker = new Faker();
List<String> listName = [];
List<int> indexPressed = [];

Widget profilePict(String pict, bool status) {
  return Container(
    margin: EdgeInsets.only(left: 5),
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue[900],
      image: DecorationImage(
        image: AssetImage("images/" + pict),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Transform.translate(
          offset: Offset(-5, 5),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
        ),
        (status)
            ? Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              )
            : Container(),
      ],
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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState() {
    for (int i = 1; i <= 25; i++) {
      listName = List.from(listName)..add(faker.person.firstName());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SimpleChat",
          style: TextStyle(fontFamily: "Pacifico"),
        ),
        actions: [
          (indexPressed.isEmpty)
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      indexPressed.sort();
                      List<int> tmp = List.from(indexPressed.reversed);
                      for (int val in tmp) {
                        listName.removeAt(val);
                      }
                      tmp.clear();
                      indexPressed.clear();
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900], Colors.purple],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    indexPressed = List.from(indexPressed)..add(index);
                  });
                },
                // onLongPressUp: () {
                //   setState(() {});
                // },
                onTap: () {
                  if (indexPressed.contains(index)) {
                    indexPressed = List.from(indexPressed)..remove(index);
                    setState(() {});
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.11,
                  color: (indexPressed.contains(index))
                      ? Colors.purple[400].withOpacity(0.2)
                      : Colors.transparent,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[900],
                              image: DecorationImage(
                                image: AssetImage("images/test_sunset.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Transform.translate(
                                  offset: Offset(-5, 5),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                (indexPressed.contains(index))
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          )),
                      Flexible(
                        flex: 13,
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "20/08/2020",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Text(
                                "Lorem Ipsum set color ..",
                                maxLines: 1,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: listName.length,
          ),
          Align(
            alignment: Alignment(0.90, 0.95),
            child: FloatingActionButton(
              backgroundColor: Colors.purple[600],
              elevation: 4,
              onPressed: () {},
              child: Icon(
                Icons.comment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
