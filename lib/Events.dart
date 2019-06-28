import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:sticky_header_list/sticky_header_list.dart';
import 'Separator.dart';

class Counter2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return rt();
  }
}

class rt extends State<Counter2> {
  String url = 'https://demo1744225.mockable.io/medium2';
  var data;
  var data1;
  var extractdata;
  var list = [];
  var list1 = [];
  var list2 = [];
  var list3 = [];
  var list4 = [];
  var image = [];
  var city_count = [];
  var image_count = [];
  int date_count = 0;
  var total_city = 0;
  var k2 = 0;
  static const row = 50;
  var column = 50;
  List<List> test = new List<List>(row);
  List<List> test2 = new List<List>(row);
  List<List> test3 = new List<List>(row);
  List<List> test4 = new List<List>(row);
 // List<String> image_url = new List<String>();

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      extractdata = json.decode(response.body);
      data = extractdata["date"];

      for (var i = 0; i < row; i++) {
        test[i] = new List(column);
        test2[i] = new List(column);
        test3[i] = new List(column);
        test4[i] = new List(column);
      //  image_url[i] = new List(column);


      }

      for (var i in data) {
        int count = 0;
        date_count = date_count + 1;
        list.add(i);
        data1 = extractdata[i];
        for (var j in data1) {
          count = count + 1;
          list1.add(j["title"]);
          list2.add(j["desc"]);
          list3.add(j["start_time"]);
          list4.add(j["end_time"]);
//          for(var z in j["attendees"])
//          image_url.add(z);
        }
        total_city = total_city + count;
        city_count.add(count);
      }
      print("atttttttttttttttttttttttt");
     // print(image_url);
      print(list);
      print(total_city);
      print(list1);
      print(city_count);

      for (var i = 0; i < date_count; i++) {
        for (var j = 0; j < city_count[i]; j++) {
          for (k2; k2 < total_city; k2++) {
            test[i][j] = list1[k2];
            test2[i][j] = list2[k2];
            test3[i][j] = list3[k2];
            test4[i][j] = list4[k2];

            break;
          }
          k2 = k2 + 1;
        }
      }
      print(test.toString());
      print(test[0]);
      print(test[0][0]);
    });
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(
              list[index],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Container(
                          width: wid * 0.2,
                        ),
                        Text(test[index][i]),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Container(
                          width: wid * 0.2,
                        ),
                        Text(test3[index][i] + "-" + test4[index][i]),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Container(
                          width: wid * 0.2,
                        ),
                        Text(test2[index][i]),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Container(
                          width: wid * 0.2,
                        ),
//                        for (var t = 0; t < image_url.length; t++)
//                          {CircleAvatar(
//                            radius: 10,
//                            backgroundImage: NetworkImage(
//                                image_url[t]),
//                            backgroundColor: Colors.transparent,
//                          )}
                      ],
                    ),
                    if (i < city_count[index] - 1)
                      MySeparator(
                        color: Colors.grey,
                      )
                  ],
                );
              },
              itemCount: city_count[index], // this is a hardcoded value
            ),
          ],
        );
      },
      itemCount: date_count, // this is a hardcoded value
    );
  }
}
