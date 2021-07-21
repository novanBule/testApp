import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  bool _isShowPassword = false;

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.5;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.red[500], Colors.red[800]],
          //   begin: FractionalOffset.topLeft,
          //   end: FractionalOffset.bottomRight,
          // ),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -getSmallDiameter(context) / 4,
              right: -getSmallDiameter(context) / 4,
              child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.deepOrange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -getBigDiameter(context) / 3,
              left: -getBigDiameter(context) / 8,
              child: Container(
                width: getBigDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink[900], Colors.orange[700]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      top: getBigDiameter(context) * 0.55,
                      left: getBigDiameter(context) * 0.3),
                  child: Text(
                    'Horizon',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 300, 10, 5),
                    padding: EdgeInsets.fromLTRB(7, 10, 7, 40),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/test.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.deepOrange,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: !_isShowPassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.deepOrange,
                            ),
                            suffixIcon: (!_isShowPassword)
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = true;
                                      });
                                    },
                                    icon: (Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.orange,
                                    )))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      color: Colors.orange,
                                    )),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 5, 7, 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 5, 7, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.48,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Colors.deepOrange,
                                Colors.orange[500]
                              ]),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: Colors.blue,
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          elevation: 2,
                          child: Image(
                            image: AssetImage("images/facebook.png"),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          elevation: 2,
                          child: Image(
                            image: AssetImage("images/twitter.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DON'T HAVE AN ACCOUNT?  ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
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
