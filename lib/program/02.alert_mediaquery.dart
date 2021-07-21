import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue[700]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                image: AssetImage('images/texture4.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: username,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key_sharp,
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  String usernameValue = username.text;
                  String passwordValue = password.text;

                  if (usernameValue == 'novan' &&
                      passwordValue == 'akuganteng') {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPageMain();
                    }));
                  } else {
                    testAlert(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Material(
                      elevation: 4,
                      color: Colors.blue[800],
                      shape: StadiumBorder(),
                      child: Center(
                        child: Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Text(
              "HorizonApp",
              style: TextStyle(
                color: Colors.red[50],
                fontFamily: "OdibeeSans",
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void testAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error Login!'),
            content: Text('Incorrect username or password!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: Text('OK')),
            ],
          );
        });
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPageMain(),
    );
  }
}

class SecondPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8, left: 5),
                child: Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  "Novan",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Material(
                  color: Colors.purple,
                  shape: StadiumBorder(),
                  child: Center(
                    child: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? Text("Portait", style: TextStyle(color: Colors.white))
                        : Text("Landscape",
                            style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
