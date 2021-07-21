import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var now = new DateTime.now();

List<String> names = [];

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            key: ValueKey(names[index]),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/moon.jpg"),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(names[index]),
                  Text(
                    now.day.toString() +
                        "-" +
                        now.month.toString() +
                        "-" +
                        now.year.toString() +
                        " | " +
                        now.hour.toString() +
                        ":" +
                        now.minute.toString(),
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              // trailing: Container(
              //   margin: EdgeInsets.only(bottom: 5, top: 5),
              //   child: Card(
              //     elevation: 4,
              //     shape: StadiumBorder(),
              //     child: IconButton(
              //         onPressed: () {
              //           setState(() {
              //             names = List.from(names)..removeAt(index);
              //           });
              //         },
              //         icon: Icon(
              //           Icons.person_remove,
              //           color: Colors.red,
              //         )),
              //   ),
              // ),
            ),
          );
        },
        itemCount: names.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }

            final element = names.removeAt(oldIndex);
            names.insert(newIndex, element);
          });
        });
  }
}

// class MyListView extends StatefulWidget {
//   @override
//   _MyListViewState createState() => _MyListViewState();
// }

// class _MyListViewState extends State<MyListView> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: names.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage("images/moon.jpg"),
//             ),
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(names[index]),
//                 Text(
//                   now.day.toString() +
//                       "-" +
//                       now.month.toString() +
//                       "-" +
//                       now.year.toString() +
//                       " | " +
//                       now.hour.toString() +
//                       ":" +
//                       now.minute.toString(),
//                   style: TextStyle(
//                     fontSize: 10,
//                   ),
//                 ),
//               ],
//             ),
//             trailing: Container(
//               margin: EdgeInsets.only(bottom: 5, top: 5),
//               child: Card(
//                 elevation: 4,
//                 shape: StadiumBorder(),
//                 child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         names = List.from(names)..removeAt(index);
//                       });
//                     },
//                     icon: Icon(
//                       Icons.person_remove,
//                       color: Colors.red,
//                     )),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
          title: Text("Exam"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.blue[800],
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("images/texture4.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(7),
                        child: TextField(
                          controller: controller,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            names = List.from(names)..add(controller.text);
                            controller.clear();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: Material(
                              color: Colors.purple,
                              shape: StadiumBorder(),
                              elevation: 4,
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(flex: 13, child: MyListView()),
          ],
        ),
      ),
    );
  }
}
