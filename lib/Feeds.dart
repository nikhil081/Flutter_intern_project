import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return io();
  }

// Stateful Widgets don't have build methods.
// They have createState() methods.
// Create State returns a class that extends Flutters State class.

}


class io extends State<Counter> {


  @override
  void initState() {
    super.initState();

  }

  Widget build(context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: new Container(
          width: wid,
          child: new Column(
            children: <Widget>[
              new Container(
                height: hei * 0.06,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    width: wid * 0.10,
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://image.flaticon.com/icons/png/128/181/181549.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25, left: 10),
                    child: new Text(
                      "Name Surname",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    width: wid * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: new Text(
                      "1h ago",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              new Container(
                height: hei * 0.03,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    width: wid * 0.10,
                  ),
                  Expanded(
                      child: new Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor #incididunt ero labore et dolore magna aliqua. ",
                    style: TextStyle(fontSize: 15),
                  )),
                  new Container(
                    width: wid * 0.10,
                  )
                ],
              ),
              new Container(
                height: hei * 0.05,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    width: wid * 0.10,
                  ),
                  new Container(
                    width: wid * 0.8,
                    height: hei * 0.28,
                    color: new Color(0xff656565),
                  ),
                  new Container(
                    width: wid * 0.10,
                  ),
                ],
              ),
              new Container(
                height: hei * 0.05,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    width: wid * 0.10,
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Heart_font_awesome.svg/1024px-Heart_font_awesome.svg.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: new Text(
                      "609",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  new Container(
                    width: wid * 0.05,
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                        "https://cdn4.iconfinder.com/data/icons/eldorado-basic/40/comment_chat-512.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: new Text(
                      "120",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  new Container(
                    width: wid * 0.37,
                  ),
                  new Text(
                    "SHARE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
