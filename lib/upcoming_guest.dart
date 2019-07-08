import 'package:flutter/material.dart';

class yui extends StatelessWidget {
  Widget build(BuildContext context) {
    final title = 'Upcoming Guest';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(12, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.grey[350],
                  width: 10,
                  height: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://image.shutterstock.com/image-vector/social-member-vector-icon-person-260nw-1134640166.jpg")),
                        Text(
                          "John Doe",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
