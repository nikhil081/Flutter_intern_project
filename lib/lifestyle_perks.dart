import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
bool visibilitytag = false;



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://demo9206388.mockable.io/lifestyle';
  var data;
  var extractdata;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      extractdata = json.decode(response.body);
      data = extractdata;
      visibilitytag = true;
    });

    print(data[0]["title"]);
  }

  @override
  void initState() {
    this.makeRequest();
    visibilitytag = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('LifeSytle Perks'),centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: visibilitytag?Container(
            child: new ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: new Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Text(
                                data[index]["title"],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index]["desc"],textAlign: TextAlign.center,),
                            ),
                            Text("Know More"),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("REDEEM",style: TextStyle(fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ):new CircularProgressIndicator(),
        ));
  }
}