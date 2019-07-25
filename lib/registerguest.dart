import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'upcoming_guest.dart';
import 'main.dart';
var formatted;

var names;
var p;
var cp;
String Date = "Date";
String time = "Time";

class RegisterGuest extends StatefulWidget {
  @override
  State createState() => new RegisterGuestState();
}

class RegisterGuestState extends State<RegisterGuest> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(picked);
        var formatter = new DateFormat('d MMM yyyy');
        formatted = formatter.format(selectedDate);

        Date = formatted;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        print(picked);
        var formatter = new TimeOfDay(hour: picked.hour, minute: picked.minute);

        time = formatter
            .toString()
            .replaceFirst("TimeOfDay(", "")
            .replaceAll(")", "");
      });
  }

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  String passwrd;

  String na;
  String paswrd;

  onSubmittedpassward(var pas) {
    setState(() {
      p = pas;
    });
  }

  onSubmittedconfirmpass(var conp) {
    setState(() {
      cp = conp;
    });
  }

  onSubmittedname(var nam) {
    setState(() {
      names = nam;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Form(
                autovalidate: true,
                child: new Container(
                  margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: new TextFormField(
                            controller: name,
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: ("Guest Name"),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)))),
                            validator: (val) => val.length < 1 && val.length > 1
                                ? 'Enter valid Name'
                                : null,
                            onSaved: (val) => na = val,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: new Text(
                            "Time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: InkWell(
                            onTap: () {
                              _selectDate(
                                  context); // Call Function that has showDatePicker()
                            },
                            child: IgnorePointer(
                              child: new TextFormField(
                                decoration: new InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    ),
                                    hintText: "$Date"),

                                // validator: validateDob,
                                onSaved: (String val) {
//                                    selectedDate=val;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: IgnorePointer(
                              child: new TextFormField(
                                controller: password,
                                decoration: new InputDecoration(
                                    prefixIcon: Icon(Icons.alarm),
                                    hintText: "$time",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: new TextFormField(
                            controller: confirmpass,
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                labelText: "Location",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: new RaisedButton(
                              onPressed: () {
                                onSubmittedname(name.text);

                                onSubmittedpassward(password.text);
                                onSubmittedconfirmpass(confirmpass.text);
                                print("Name is " + names.toString());

                                print("password is " + p.toString());
                                print("confirmpass is " + cp.toString());
                              },
                              child: new Text(
                                "Register Guest",
                                style: TextStyle(fontSize: 20),
                              ),
                              color: Colors.white,
                              textColor: Colors.black,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.black)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: Container(
                height: 100,
                width: 300,
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new yui()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "View Upcoming Guests",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  color: Colors.grey[350],
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
