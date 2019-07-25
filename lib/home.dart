import 'package:flutter/material.dart';
import 'Feeds.dart';
import 'Events.dart';
import 'feeds_events.dart';

class Home extends StatefulWidget {
  static TabController controller2;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _home();
  }
}

class _home extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller4;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
//            appBar: TabBar(
//              labelColor: Colors.black,
//              indicator: BoxDecoration(color: Colors.grey[300]),
//              tabs: ([
//                new Container(
//                  width: width / 2,
//                  child: new Tab(text: 'Feeds'),
//                ),
//                new Container(
//                  width: width / 2,
//                  child: new Tab(text: 'Events'),
//                ),
//              ]),
//            ),
            body: TabBarView(
              children: [
                new TabBarDemoo(),
                new Text("2"),
                new Text("3"),
                new Text("4"),
                new Text("5"),
              ],
              controller: controller4,
            ),
            bottomNavigationBar: new Material(
              // set the color of the bottom navigation bar
              color: new Color(0xff292929),
              // set the tab bar as the child of bottom navigation bar
              child: new TabBar(
                tabs: <Tab>[
                  new Tab(
                    // set icon to the tab
                    icon: new Icon(Icons.wallpaper),
                  ),
                  new Tab(
                    icon: new Icon(Icons.ring_volume),
                  ),
                  new Tab(
                    icon: new Icon(Icons.location_city),
                  ),
                  new Tab(
                    icon: new Icon(Icons.person_outline),
                  ),
                  new Tab(
                    icon: new Icon(Icons.settings),
                  ),
                ],
                // setup the controller
                controller: controller4,
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller4 = new TabController(length: 5, vsync: this);
  }
}
