import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: TabBar(
            indicator: BoxDecoration(color: Colors.grey),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            tabs: [
              Container(
                width: width * 0.25,
                height: height * 0.06,
                child: Center(
                  child: Text(
                    "Refer",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * 0.25,
                height: height * 0.06,
                child: Center(
                  child: Text(
                    "Track",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              Container(
                width: width * 0.25,
                height: height * 0.06,
                child: Center(
                  child: Text(
                    "Paid",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              Container(
                width: width * 0.25,
                height: height * 0.06,
                child: Center(
                  child: Text(
                    "Link",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Enter your referral's information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(hintText: "Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                              decoration:
                                  new InputDecoration(hintText: "E-Mail")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: new InputDecoration(hintText: "Phone"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            "Tell us More About this Person",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(hintText: "Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                              decoration:
                                  new InputDecoration(hintText: "E-Mail")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: new InputDecoration(hintText: "Phone"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: new InputDecoration(hintText: "Phone"),
                          ),
                        ),
                      ],
                    )),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
