import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyHomePagee extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {
  String url = 'http://demo9206388.mockable.io/events';
  var extractdata1;
  var extractdata2;
  var extractdata3;
  var extractdata;
  var list = [];
  var city_list = [];
  var desc_list = [];
  var image_list = [];
  var city_count = [];
  int date_count = 0;
  var total_city = 0;
  var total_image = 0;
  var image_count_list = [];
  var title_index = 0;
  var image_count_list_index = 0;
  var image_index = 0;
  static const row = 50;
  var column = 50;
  var date1;
  var count = 0;
  List<List> city_array = new List<List>(row);
  List<List> desc_array = new List<List>(row);
  List<List> image_count_array = new List<List>(row);
  List<List> image_array = new List<List>(row);

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      extractdata = json.decode(response.body);
      extractdata1 = extractdata["date"];

      for (var i = 0; i < row; i++) {
        city_array[i] = new List(column);
        desc_array[i] = new List(column);
        image_array[i] = new List(column);
        image_count_array[i] = new List(column);
      }
      for (var i = 0; i < column; i++) {
        for (var j = 0; j < column; j++) image_array[i][j] = new List(column);
      }

      for (var i in extractdata1) {
        int count = 0;
        date_count = date_count + 1;

        date1 = DateTime.parse(i);
        var formatter = new DateFormat("EEE,MMM dd");
        var formatted = formatter.format(date1);
        list.add(formatted);

        extractdata2 = extractdata[i];

        for (var j in extractdata2) {
          count = count + 1;
          city_list.add(j["title"]);
          desc_list.add(j["desc"]);
        }
        total_city = total_city + count;
        city_count.add(count);
      }

      for (var i = 0; i < date_count; i++) {
        for (var j = 0; j < city_count[i]; j++) {
          for (title_index; title_index < total_city; title_index++) {
            city_array[i][j] = city_list[title_index];
            desc_array[i][j] = desc_list[title_index];
            break;
          }
          title_index = title_index + 1;
        }
      }
      for (var i in extractdata1) {
        extractdata2 = extractdata[i];
        for (var j in extractdata2) {
          var count_img = 0;
          extractdata3 = j["attendees"];
          for (var k in extractdata3) {
            count_img = count_img + 1;
            total_image = total_image + 1;
            image_list.add(k);
          }
          image_count_list.add(count_img);
        }
      }
      for (int i = 0; i < date_count; i++) {
        for (int j = 0; j < city_count[i]; j++) {
          for (image_count_list_index;
              image_count_list_index < image_count_list.length;
              image_count_list_index++) {
            image_count_array[i][j] = image_count_list[image_count_list_index];
            break;
          }
          image_count_list_index = image_count_list_index + 1;
        }
      }
      for (var i = 0; i < date_count; i++) {
        for (var j = 0; j < city_count[i]; j++) {
          for (var k = 0; k < image_count_array[i][j]; k++) {
            for (image_index; image_index < total_image; image_index++) {
              image_array[i][j][k] = image_list[image_index];
              break;
            }
            image_index = image_index + 1;
          }
        }
      }
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
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  list[index],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 13, top: 15, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                city_array[index][i],
                                style: TextStyle(fontSize: 24),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("2:30PM - 4:00PM"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                    child: Text(desc_array[index][i])),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    child: Row(
                                      children: <Widget>[
                                        ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: image_count_array[index]
                                                [i],
                                            shrinkWrap: true,
                                            itemBuilder: (context, j) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                        child: CircleAvatar(
                                                            radius: 22,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    image_array[
                                                                            index]
                                                                        [
                                                                        i][j]))),
                                                    Container(
                                                      width: 4,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 1),
                                          child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  "https://image.freepik.com/free-icon/plus-symbol-circle-add-button_318-9891.jpg")),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(child: Text("Attend"))
                                ],
                              )
                            ],
                          ),
                        ),
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
