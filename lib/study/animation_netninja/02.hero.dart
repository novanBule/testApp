import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Container(
          margin: EdgeInsets.only(top: 5, left: 5),
          width: 100,
          height: 100,
          child: Hero(
            tag: 'img',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "images/test_sunset.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'img',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  width: 300,
                  height: 300,
                  child:
                      Image.asset("images/test_sunset.png", fit: BoxFit.fill),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius molestie enim. Duis sed iaculis ipsum, sit amet molestie enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras accumsan eros est, ac pulvinar purus sagittis at. Phasellus ut magna tortor. Nam non lorem vel ante auctor sagittis id quis ex. Quisque vitae turpis erat. Suspendisse eget est condimentum arcu feugiat feugiat. Donec pulvinar fringilla faucibus. Donec eget nunc nec felis venenatis sagittis. Quisque quis diam quis nunc facilisis vulputate. Donec feugiat nibh eget viverra gravida. Fusce mollis tellus eu ultricies venenatis. Phasellus consectetur odio eros, ut dignissim lorem suscipit eu. Aliquam condimentum dui lectus, sed auctor ex pharetra id.',
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
