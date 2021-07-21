import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFE5788), Color(0xFFF56D5D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // 2. Content
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage("images/pattern3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.35,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(4),
                    //       topRight: Radius.circular(4),
                    //     ),
                    //     image: DecorationImage(
                    //       image: AssetImage("images/sunset.jpg"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? _imagePortait(_heightScreen, "images/sunset.jpg")
                        : _imageLandscape(_heightScreen, "images/sunset.jpg"),

                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? _contentPortait(_heightScreen)
                        : _contentLandscape(_heightScreen),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePortait(double heightScreen, String img) {
    return Container(
      height: heightScreen * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imageLandscape(double heightScreen, String img) {
    return Container(
      height: heightScreen * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _contentPortait(double heightScreen) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30 + heightScreen * 0.35, 20, 20),
      child: Center(
        child: Column(
          children: [
            Text(
              "Beatiful Sunset at Paddy Field",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF56D5D),
                fontSize: 25,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Posted on  ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "March 13, 2021",
                    style: TextStyle(
                      color: Color(0xFFF56D5D),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(flex: 10),
                // Icon Likes
                Icon(
                  Icons.thumb_up,
                  size: 18,
                  color: Colors.grey,
                ),
                Spacer(flex: 1),
                // Text for Likes
                Text(
                  "99",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(flex: 5),
                // Icon Comments
                Icon(
                  Icons.comment,
                  size: 18,
                  color: Colors.grey,
                ),
                Spacer(flex: 1),
                // Text for comment
                Text(
                  "888",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(flex: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentLandscape(double heightScreen) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10 + heightScreen * 0.35, 20, 20),
      child: Center(
        child: Column(
          children: [
            Text(
              "Beatiful Sunset at Paddy Field",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF56D5D),
                fontSize: 25,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Posted on  ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "March 13, 2021",
                    style: TextStyle(
                      color: Color(0xFFF56D5D),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(flex: 10),
                // Icon Likes
                Icon(
                  Icons.thumb_up,
                  size: 18,
                  color: Colors.grey,
                ),
                Spacer(flex: 1),
                // Text for Likes
                Text(
                  "99",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(flex: 2),
                // Icon Comments
                Icon(
                  Icons.comment,
                  size: 18,
                  color: Colors.grey,
                ),
                Spacer(flex: 1),
                // Text for comment
                Text(
                  "888",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(flex: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
