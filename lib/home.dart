import 'package:flutter/material.dart';
import 'Feeds.dart';
import 'Events.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _home();
  }
}

class _home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: TabBar(
                labelColor: Colors.black,

                isScrollable: true,
                indicator: BoxDecoration(color: Colors.grey[300]),
                tabs: ([
                  new Container(
                    width: width/2,
                    child: new Tab(text: 'Feeds'),
                  ),
                  new Container(
                    width: width/2,
                    child: new Tab(text: 'Events'),
                  ),

                ]),
              ),
              body: TabBarView(children: [
                Container(
                  child: new Counter(),
                ),
                Container(
                  child: new MyHomePage(),
                )
              ])),
        ));
  }
}
