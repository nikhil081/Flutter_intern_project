import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'dart:async';
import 'main.dart';
import 'register.dart';

var number;
var passs;
int _state = 0;

class logi extends StatefulWidget {
  logi({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginpage();
  }
}

class _loginpage extends State<logi> with TickerProviderStateMixin {
  TextEditingController num = TextEditingController();
  TextEditingController pass = TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  var no;
  String _password;
  bool visibilitytag = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  onSubmittednumber(var value) {
    setState(() => number = value);
  }

  onSubmittedpass(var valu) {
    setState(() => passs = valu);
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: hei * 0.08,
            ),
            new Container(
                width: wid,
                child: new CircleAvatar(
                  child: Icon(Icons.panorama),
                )),
            new Container(
              height: hei * 0.08,
            ),
            new Form(
              autovalidate: true,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: new TextFormField(
                        controller: num,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "enter number",
                            fillColor: Colors.white70),
                        validator: (String arg) {
                          if (arg.length < 11 && arg.length > 1)
                            return 'Number must not be less than 10 charaters';
                          else
                            return null;
                        },
                        onSaved: (String val) {
                          no = val;
                        },
                      ),
                    ),
                    new Container(
                      height: hei * 0.02,
                    ),
                    Container(
                      child: new TextFormField(
                        obscureText: _obscureText,
                        controller: pass,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: _toggle),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "enter password",
                            fillColor: Colors.white70),
                        validator: (String arg) {
                          if (arg.length < 8 && arg.length > 1)
                            return 'Password must be more than 8 charater';
                          else
                            return null;
                        },
                        onSaved: (String val) {
                          _password = val;
                        },
                      ),
                    ),
                    new Container(
                      height: hei * 0.02,
                    ),
                    new MaterialButton(
                      //child: setUpButtonChild(),
                      child: new Text("login"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new bottom()));

//                            setState(() {
//                              if (_state == 0) {
//                                animateButton();
//                              }
//                            });
                      },
                      elevation: 4.0,
                      minWidth: double.infinity,
                      color: Colors.lightGreen,
                    ),
                    new MaterialButton(
                      //child: setUpButtonChild(),
                      child: new Text("register"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new RegisterPage()));
//                            setState(() {
//                              if (_state == 0) {
//                                animateButton();
//                              }
//                            });
                      },
                      elevation: 4.0,
                      minWidth: double.infinity,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
              ),
            ),

//
            FacebookSignInButton(onPressed: () {
              // call authentication logic
            })
          ],
        ),
      ),
    ));
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });
    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _state = 2;
      });
    });
  }
}

Widget setUpButtonChild() {
  if (_state == 0) {
    return new Text(
      "Login",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  } else if (_state == 1) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  } else if (_state == 2) {
    return Icon(Icons.check, color: Colors.white);
  }
}
