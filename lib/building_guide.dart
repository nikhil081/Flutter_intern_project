import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class MyHomebuilding extends StatefulWidget {
  @override
  _MyHomebuildingState createState() => new _MyHomebuildingState();
}

class _MyHomebuildingState extends State<MyHomebuilding> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    var wid = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(


      body: ListView.builder(itemBuilder: (BuildContext context , int index)=>
          EntryItem (data[index]),
        itemCount: data.length,
      ),



    );

  }



}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}


// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Handy Information',
    <Entry>[
      Entry(
        'Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore'
            ' Consectetur adipisicing elit, sed do eiusmod tempo',

      ),
      Entry('Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore'
          ' Consectetur adipisicing elit, sed do eiusmod tempo'),
      Entry('Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore '
          'Consectetur adipisicing elit, sed do eiusmod tempo'),
    ],
  ),
  Entry(
    'Network Information',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Conference Room',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',

      ),
    ],
  ),
  Entry(
    'Kitchen',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',

      ),
    ],
  ),
  Entry(
    'Membership Fee',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',

      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {



  EntryItem(this.entry);


  Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title,style: TextStyle(fontSize: 17),));
    return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        children: root.children.map(_buildTiles).toList(),
        trailing: const Icon(Icons.add)
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}