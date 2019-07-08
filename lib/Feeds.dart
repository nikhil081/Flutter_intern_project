import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:flutter/services.dart';

var getdata;
var abc;
var formatted;
var different;
var like;
var list_date = new List<String>();
var now = DateTime.now();

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
  Color _iconColor = Colors.black;
  bool visi = true;
  String url = "http://demo3057125.mockable.io/next";
  var data;

  Future<String> makeRequest() async {
    var response =
        await http.get((url), headers: {"Accept": "application/json"});
    setState(() {
      getdata = json.decode(response.body);
      data = getdata;
      print(data);
      for (var abc in data) {
        list_date.add(abc["time"].toString());
        var date1 = DateTime.parse(data[0]["time"]);
        var formatter = new DateFormat('yyyy-MM-dd  kk:mm:ss');
        formatted = formatter.format(date1);
        var date2 = DateTime.parse(now.toString());
        var formatters = new DateFormat('yyyy-MM-dd  kk:mm:ss');
        formatted = formatters.format(date2);
        print(date1.isBefore(date2));
        print(date1.isAfter(date2));
        different = date2.difference(date1);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  Widget build(context) {
    String formattedTime = DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
    print(formattedTime);

    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: new Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: wid,
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: hei * 0.06,
                  ),
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: wid * 0.05,
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(data[i]["image_1"]),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25, left: 10),
                        child: new Text(
                          data[i]["name"],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Container(
                        width: wid * 0.25,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: new Text(
                            date(list_date[i]),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
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
                        width: wid * 0.05,
                      ),
                      Expanded(
                          child: new Text(
                        data[i]["description"],
                        style: TextStyle(fontSize: 20),
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
                        width: wid * 0.05,
                      ),
                      new Container(
                        width: wid * 0.85,
                        height: hei * 0.3,
                        child: new Image.network(
                          data[i]["image_2"],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    height: hei * 0.02,
                  ),
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: wid * 0.05,
                      ),
                      new IconButton(
                          icon: Icon(Icons.favorite),
                          color: _iconColor,
                          onPressed: () {
                            setState(() {
                              if (visi) {
                                print("111");
                                visi = false;
                                _iconColor = Colors.red;
                                int aa = 0;
                                aa = int.parse(data[i]["likes"].toString());
                                data[i]["likes"] = "${aa + 1}";
                              } else {
                                print("175");
                                visi = true;
                                _iconColor = Colors.black;
                                int aa = 0;
                                aa = int.parse(data[i]["likes"]);
                                data[i]["likes"] = "${aa - 1}";
                              }
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: new Text(
                          data[i]["likes"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      new Container(
                        width: wid * 0.05,
                      ),
                      new IconButton(
                          icon: Icon(Icons.comment), onPressed: null),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: new Text(
                          data[i]["comments"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      new Container(
                        width: wid * 0.25,
                      ),
                      new Text(
                        "SHARE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });

//    return SingleChildScrollView(
////      child: Center(
////        child: new Container(
////          width: wid,
////          child: new Column(
////            children: <Widget>[
////              new Container(
////                height: hei * 0.06,
////              ),
////              new Row(
////                children: <Widget>[
////                  new Container(
////                    width: wid * 0.10,
////                  ),
////                  CircleAvatar(
////                    radius: 30.0,
////                    backgroundImage: NetworkImage(
////                        "https://image.flaticon.com/icons/png/128/181/181549.png"),
////                    backgroundColor: Colors.transparent,
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.only(bottom: 25, left: 10),
////                    child: new Text(
////                      "Name Surname",
////                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
////                    ),
////                  ),
////                  new Container(
////                    width: wid * 0.2,
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.only(bottom: 25),
////                    child: new Text(
////                      "1h ago",
////                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
////                    ),
////                  )
////                ],
////              ),
////              new Container(
////                height: hei * 0.03,
////              ),
////              new Row(
////                children: <Widget>[
////                  new Container(
////                    width: wid * 0.10,
////                  ),
////                  Expanded(
////                      child: new Text(
////                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor #incididunt ero labore et dolore magna aliqua. ",
////                    style: TextStyle(fontSize: 15),
////                  )),
////                  new Container(
////                    width: wid * 0.10,
////                  )
////                ],
////              ),
////              new Container(
////                height: hei * 0.05,
////              ),
////              new Row(
////                children: <Widget>[
////                  new Container(
////                    width: wid * 0.10,
////                  ),
////                  new Container(
////                    width: wid * 0.8,
////                    height: hei * 0.28,
////                    color: new Color(0xff656565),
////                  ),
////                  new Container(
////                    width: wid * 0.10,
////                  ),
////                ],
////              ),
////              new Container(
////                height: hei * 0.05,
////              ),
////              new Row(
////                children: <Widget>[
////                  new Container(
////                    width: wid * 0.10,
////                  ),
////                  CircleAvatar(
////                    radius: 10,
////                    backgroundImage: NetworkImage(
////                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Heart_font_awesome.svg/1024px-Heart_font_awesome.svg.png"),
////                    backgroundColor: Colors.transparent,
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.only(left: 5),
////                    child: new Text(
////                      "609",
////                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
////                    ),
////                  ),
////                  new Container(
////                    width: wid * 0.05,
////                  ),
////                  CircleAvatar(
////                    radius: 10,
////                    backgroundImage: NetworkImage(
////                        "https://cdn4.iconfinder.com/data/icons/eldorado-basic/40/comment_chat-512.png"),
////                    backgroundColor: Colors.transparent,
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.only(left: 5),
////                    child: new Text(
////                      "120",
////                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
////                    ),
////                  ),
////                  new Container(
////                    width: wid * 0.37,
////                  ),
////                  new Text(
////                    "SHARE",
////                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
////                  ),
////                ],
////              )
////            ],
////          ),
////        ),
////      ),
////    );
  }
}

String date(String dateString, {bool numericDates = true}) {
  DateTime date = DateTime.parse(dateString);
  final date2 = DateTime.now();
  different = date2.difference(date);
  if ((different.inDays / 365).floor() >= 2) {
    return '${(different.inDays / 365).floor()} years ago';
  } else if ((different.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  } else if ((different.inDays / 30).floor() >= 2) {
    return '${(different.inDays / 30).floor()} months ago';
  } else if ((different.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((different.inDays / 7).floor() >= 2) {
    return '${(different.inDays / 7).floor()} weeks ago';
  } else if ((different.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (different.inDays >= 2) {
    return '${different.inDays} days ago';
  } else if (different.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (different.inHours >= 2) {
    return '${different.inHours} hours ago';
  } else if (different.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (different.inMinutes >= 2) {
    return '${different.inMinutes} minutes ago';
  } else if (different.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (different.inSeconds >= 3) {
    return '${different.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
