import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Text(
                  "Refer",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Track",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Get Paid",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "My Link",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            title: Text('Refer a friend'),
          ),
          body: TabBarView(
            children: [
              Container(
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
