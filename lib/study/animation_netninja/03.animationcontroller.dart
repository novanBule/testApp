import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Hero(
            tag: 'foto',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "images/test_sunset.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'foto',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    "images/test_sunset.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              width: double.infinity,
              height: 70,
              // color: Colors.red,
              child: ListTile(
                title: Text("Sunset"),
                subtitle: Text("Beatifull sunset at paddy field"),
                trailing: Heart(),
              ),
            ),
            Descriptions(),
          ],
        ),
      ),
    );
  }
}

// Heart Icon
class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_controller);

    // 0 to 1
    // _controller.forward();

    // for value
    _controller.addListener(() {
      print("val : " + _controller.value.toString());
      print("val_color : " + _colorAnimation.value.toString());
    });

    // for status
    _controller.addStatusListener((status) {
      print("status : " + status.toString());
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}

// Decriptions text
class Descriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius molestie enim. Duis sed iaculis ipsum, sit amet molestie enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras accumsan eros est, ac pulvinar purus sagittis at. Phasellus ut magna tortor. Nam non lorem vel ante auctor sagittis id quis ex. Quisque vitae turpis erat. Suspendisse eget est condimentum arcu feugiat feugiat. Donec pulvinar fringilla faucibus. Donec eget nunc nec felis venenatis sagittis. Quisque quis diam quis nunc facilisis vulputate. Donec feugiat nibh eget viverra gravida. Fusce mollis tellus eu ultricies venenatis. Phasellus consectetur odio eros, ut dignissim lorem suscipit eu. Aliquam condimentum dui lectus, sed auctor ex pharetra id.",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
