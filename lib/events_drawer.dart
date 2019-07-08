import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Separator.dart';
import 'package:flutter/services.dart';


var getdata;
bool visibilitytag = false;

class MyHomeevents extends StatefulWidget {
  @override
  State createState() => new MyHomeeventsState();
}

class MyHomeeventsState extends State<MyHomeevents> with TickerProviderStateMixin {
  String url ="http://demo3057125.mockable.io/attend";

  AnimationController _controller;

  static const List<IconData> icons = const [ Icons.calendar_today, Icons.share, Icons.brush ];
  static const List text =["Add to Calender","Share","Add comment"];
  var data;

  Future<String> makeRequest() async {
    var response = await http.get(
        (url), headers: {"Accept": "application/json"});

    setState(() {
      getdata = json.decode(response.body);
      data = getdata["image"];
      print(data);
      visibilitytag = true;

    });
  }


  @override
  void initState() {
    this.makeRequest();
    visibilitytag = false;

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    Color backgroundColor = Colors.black;
    Color foregroundColor = Colors.grey;
    return new Scaffold(
      appBar: new AppBar(title: new Text('Attend'),backgroundColor: Colors.black,),
      body:Center(
        child: visibilitytag?


        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: new Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        child: new Text("Attend",style: TextStyle(fontSize: 20),),
                      ),
                      new Container(

                        child: new Row(


                          children: <Widget>[

                            Container(
                              height:50,
                              child: Row(
                                children: <Widget>[
                                  ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Row(

                                          children: <Widget>[
                                            Container(
                                              child:
                                              new Row(
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: NetworkImage(data[i]),
                                                  ),

                                                ],
                                              ),

                                            ),

                                          ],


                                        );
                                      }),
                                ],
                              ),
                            ),



                            new CircleAvatar(
                              radius: 20,backgroundImage: NetworkImage("https://image.freepik.com/free-icon/plus-symbol-circle-add-button_318-9891.jpg"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                MySeparator(),

                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 55),
                  child: new Text(getdata["title"],style: TextStyle(fontSize: 25),),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: new Text(getdata["start_time"]+"-"+getdata["end_time"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                new Text(getdata["desc"],style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
        ):new CircularProgressIndicator(),
      ),

      floatingActionButton: new Column(
        mainAxisSize: MainAxisSize.min,
        children:new List.generate(icons.length, (int index) {
          Widget child = new Container(

            alignment: Alignment.centerRight,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                    0.0,
                    1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut
                ),
              ),
              child:new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(text[index]),
                  new FloatingActionButton(
                    heroTag: null,
                    backgroundColor: backgroundColor,
                    mini: true,
                    child: new Icon(icons[index], color: foregroundColor),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          );
          return child;
        }).toList()..add(
          Container(
            alignment: Alignment.centerRight,
            child: new FloatingActionButton(
              heroTag: null,


              backgroundColor: backgroundColor,
              child: new AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return new Transform(
                    transform: new Matrix4.rotationZ(_controller.value  * math.pi),
                    alignment: FractionalOffset.center,

                    child: new Icon(_controller.isDismissed ? Icons.add : Icons.remove,color: foregroundColor,),
                  );
                },
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}