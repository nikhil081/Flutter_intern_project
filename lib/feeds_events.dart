import 'dart:io';
import 'check.dart';
import 'package:flutter/material.dart';
import 'Feeds.dart';
import 'Events.dart';
import 'package:connectivity/connectivity.dart';


class TabBarDemoo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _op();
  }
}

class _op extends State<TabBarDemoo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: TabBar(
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Colors.grey,
                ),
                tabs: [
                  Tab(
                    child: new Text("Feeds"),
                  ),
                  Tab(
                    child: new Text("Events"),
                  )
                ],
              ),
              body:
              new TabBarView(
                children: [
                  Container(child: new Counter()),
                  Container(
                    child: new MyHomePagee(),
                  )
                ],
              )

          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}
