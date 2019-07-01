import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://demo1744225.mockable.io/medium2';
  var data;
  var data1;
  var data2;
  var extractdata;
  var list = [];
  var city_list = [];
  var image_list = [];
  var city_count = [];
  int date_count = 0;
  var total_city = 0;
  var total_image = 0;
  var image_cnt = [];
  var k2 = 0;
  var k3 = 0;
  var l = 0;
  static const row = 3;
  var column = 3;
  int ct;
  List<List> test = new List<List>(row);
  List<List> image_count = new List<List>(row);
  List<List> test1 = new List<List>(row);
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      extractdata = json.decode(response.body);
      data = extractdata["date"];
      for (var i = 0; i < row; i++) {
        test[i] = new List(column);
        test1[i] = new List(column);
        image_count[i] = new List(column);
      }
      for (var i = 0; i < column; i++) {
        for (var j = 0; j < column; j++) test1[i][j] = new List(column);
      }
      for (var i in data) {
        int count = 0;
        date_count = date_count + 1;
        list.add(i);
        data1 = extractdata[i];
        for (var j in data1) {
          count = count + 1;
          city_list.add(j["title"]);
        }
        total_city = total_city + count;
        city_count.add(count);
      }
      for (var i = 0; i < date_count; i++) {
        for (var j = 0; j < city_count[i]; j++) {
          for (k2; k2 < total_city; k2++) {
            test[i][j] = city_list[k2];
            break;
          }
          k2 = k2 + 1;
        }
      }
      for (var i in data) {
        data1 = extractdata[i];
        for (var j in data1) {
          var count_img = 0;
          data2 = j["attendees"];
          for (var k in data2) {
            count_img = count_img + 1;
            total_image = total_image + 1;
            image_list.add(k);
          }
          image_cnt.add(count_img);
        }
      }
      for (int i3 = 0; i3 < date_count; i3++) {
        for (int j3 = 0; j3 < city_count[i3]; j3++) {
          for (k3; k3 < image_cnt.length; k3++) {
            image_count[i3][j3] = image_cnt[k3];
            break;
          }
          k3 = k3 + 1;
        }
      }
      print(image_list);
      print(image_count);
      print(test1);
      print(total_image);
      for (var i = 0; i < date_count; i++) {
        for (var j = 0; j < city_count[i]; j++) {
          for (var k = 0; k < image_count[i][j]; k++) {
            for (l; l < total_image; l++) {
              print("abc " + i.toString() + j.toString() + k.toString());
              test1[i][j][k] = image_list[l];
              break;
            }
            l = l + 1;
          }
        }
      }
      print(test1);
    });
  }
  @override
  void initState() {
    makeRequest();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    var wid = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  list[index],
                  style: Theme.of(context).textTheme.body2,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(test[index][i]),
                          ListView.builder(
                              itemCount:image_count[index][i] ,
                              shrinkWrap: true, itemBuilder: (context, j) {
                            return Container(
                              child: Text(test1[index][i][j]),
                            );
                          })
                        ],
                      ),
                    );
                  },
                  itemCount: city_count[index], // this is a hardcoded value
                ),
              ],
            ),
          );
        },
        itemCount: date_count, // this is a hardcoded value
      ),
    );
  }
}