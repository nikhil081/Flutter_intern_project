import 'package:flutter/material.dart';

class MyHomekey extends StatefulWidget {
  @override
  _MyHomePageStatekey createState() => new _MyHomePageStatekey();
}

class _MyHomePageStatekey extends State<MyHomekey> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Keycard Status'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(right: 40, left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Active",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore Consectetur adipisicing elit, sed do eiusmod tempor",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
