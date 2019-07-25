import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notifications.dart';
import 'location.dart';
import 'home.dart';
import 'profile.dart';
import 'settings.dart';
import 'register.dart';
import 'feeds_events.dart';
import 'lifestyle_perks.dart';
import 'keycard_status.dart';
import 'building_guide.dart';
import 'refer_a_friend.dart';
import 'events_drawer.dart';
import 'registerguest.dart';
import 'loginpage.dart';

int selected_index;

TabController controller = Home.controller2;

class bottom extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _hg();
  }
}

class _hg extends State<bottom> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this);
    setState(() {
      selected_index = 0;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
          appBar: new apt().getappbar(),
          drawer: Drawer(
              child: Container(
            color: Colors.black,
            child: ListView(

                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Container(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 40),
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              "https://cdn2.iconfinder.com/data/icons/business-management-52/96/Artboard_20-512.png"),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                "John Doe",
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              new Text(
                                                "San Francisco, CA",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      )),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selected_index = 0;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Add guest',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selected_index = 1;
                            });
                            Navigator.of(context).pop();
//                            Navigator.of(context)
//                                .pushReplacementNamed('/addguestscreen');
//
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Support',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selected_index = 2;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Event',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selected_index = 3;
                            });
                            Navigator.of(context).pop();

//
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Upcoming Reservations',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            setState(() {
                              selected_index = 4;
                            });
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Building Guide',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            setState(() {
                              selected_index = 5;
                            });
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => new MyHomebuilding()));
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Company Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            setState(() {
                              selected_index = 6;
                            });
                          },
                        ),
                        ListTile(
                          title: Text(
                            'LifeStyle Perks',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
//

                            setState(() {
                              selected_index = 7;
                            });
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => new MyHomePage()));
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Keycard status',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
//

                            selected_index = 8;
//
                          },
                        ),
                        new Divider(
                          color: Colors.white,
                          height: 50,
                        ),
                        ListTile(
                          title: Text(
                            'Refer a Friend',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
//

                            setState(() {
                              selected_index = 9;
                            });

//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => new TabBarDemo()));
                          },
                        ),
                        ListTile(
                          title: Text(
                            'About',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            setState(() {
                              selected_index = 10;
                            });
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {

//                            if (text == true) {
//                              check();
//
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => new logi(counter: false)));
//
//
//                            } else {
////
//                              print("text in else isssssss");
//                              print(text);
//                          }
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
          body: new Container(
            child: _getwidget(selected_index),
          ),
        ),
        onWillPop: () {
          print("gdfgdrhrh");
          print(selected_index);
          if (selected_index == 0) {
            _onWillPop(context);
          } else {
            Navigator.pushReplacementNamed(context, '/mainscreen');
          }

//
        });
  }
}


Future<bool> _onWillPop(BuildContext context) {
  return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => exit(0),
                  child: new Text('Yes'),
                ),
              ],
            ),
      ) ??
      false;
}

_getwidget(int i) {
  switch (i) {
    case 0:
      return new Home();

      break;
    case 1:
      return new RegisterGuest();
      break;
//    case 2:
//        //suportt
//      break;
    case 3:
      return new MyHomeevents();
      break;
    case 4:
      //upcoming guests
      break;
    case 5:
      return new MyHomebuilding();
      break;
//    case 6:
//      //company profile
//      break;
    case 7:
      return new MyHomePage();
      break;
    case 8:
      return new MyHomekey();
      break;
    case 9:
      return new TabBarDemo();
      break;
    case 10:
      //about
      break;
//    case 11:
//      //logoout
//      break;
  }
}

class apt {
  Widget getappbar() {
    return AppBar(
      title: _gettitle(selected_index),
//      leading: Builder(builder:
//          (context) =>
//          IconButton(
//            icon: new Icon(Icons.settings),
//            onPressed: () {},
//          )),

      actions: <Widget>[
        Container(padding: const EdgeInsets.all(8.0), child: Icon(Icons.search))
        // here add other icon
      ],

      backgroundColor: new Color(0xff292929),
    );
  }
}

Widget _gettitle(int i) {
  switch (i) {
    case 0:
      return null;
      break;
    case 1:
      return Text("Register Guest");
      break;
//    case 2:
//        //suportt
//      break;
    case 3:
      return Text("Attend");

      break;
    case 4:
      //upcoming guests
      break;
    case 5:
      return Text("Building Guide");
      break;
//    case 6:
//      //company profile
//      break;
    case 7:
      return Text("LifeStyle Perks");
      break;
    case 8:
      return Text("Keycard Status");
      break;
    case 9:
      return Text("Refer a friend");
      break;
    case 10:
      //about
      break;
//    case 11:
//      //logoout
//      break;
  }
}
