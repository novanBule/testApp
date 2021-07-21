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
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.red[900], Colors.purple[800]],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Circle2(),
          Circle1(),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red[900], Colors.purple[800]],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                ImageTitleWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(),
                    DescriptionTitleWidget(),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: FormLogin(),
                ),
                ButtonLogin(),
                SignUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      child: Text(
        "Horizonn.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: "LobsterTwo",
          fontWeight: FontWeight.bold,
        ),
      ),
      builder: (BuildContext context, _val, Widget child) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              _val * (MediaQuery.of(context).size.width * 0.50),
              _val * ((MediaQuery.of(context).size.height * 0.23) / 2),
              0,
              5),
          child: child,
        );
      },
    );
  }
}

class DescriptionTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      child: Text(
        "Make your business grow up",
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontFamily: "DancingScript",
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      builder: (BuildContext context, _val, Widget child) {
        // return Opacity(opacity: _val, child: child);
        return Padding(
          padding: EdgeInsets.only(
            left: _val * (MediaQuery.of(context).size.width * 0.38),
          ),
          child: child,
        );
      },
    );
  }
}

class ImageTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 4),
      tween: Tween<double>(begin: 0, end: 1),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 35, 0, 5),
        width: MediaQuery.of(context).size.width * 0.35,
        height: (MediaQuery.of(context).size.height * 0.3) * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/team.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      builder: (BuildContext context, _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
    );
  }
}

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.pink[900],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink[900],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.visibility,
                      color: Colors.pink[900],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink[900],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 15, 8, 5),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.red[900], Colors.purple[800]],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Circle1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Positioned(
          left: -_val * 100,
          bottom: -_val * 100,
          child: Opacity(
            opacity: _val * 0.4,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [Colors.red[900], Colors.purple[800]]),
          ),
        ),
      ),
    );
  }
}

class Circle2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Positioned(
          bottom: _val * -150,
          right: _val * -150,
          child: child,
        );
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.purple[800],
                Colors.red[900],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Align(
          alignment: Alignment(-1 + _val, 0),
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Text(
          "SIGN UP",
          style: TextStyle(
            color: Colors.pink[800],
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
