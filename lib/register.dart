import 'package:flutter/material.dart';
import 'otp.dart';

var names;
var e;
var c;
var p;
var cp;

class RegisterPage extends StatefulWidget {
  @override
  State createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool ck = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  bool op = true;
  bool opc = true;
  String passwrd;
  int cont;
  String na;
  String paswrd;

  void _toggle() {
    setState(() {
      op = !op;
    });
  }

  void toggle() {
    setState(() {
      opc = !opc;
    });
  }

  onSubmittedcontact(var con) {
    setState(() {
      c = con;
    });
  }

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

  onSubmittedemail(var am) {
    setState(() {
      e = am;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new apt().getappbar(),
      body: SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.only(bottom: 50),
          child: new Column(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(190),
                        bottomLeft: Radius.circular(190))),
                child: new Center(
                  child: new Icon(
                    Icons.search,
                    size: 80,
                  ),
                ),
              ),
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
                          new Text(
                            "Enter your details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: new TextFormField(
                              controller: name,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)))),
                              validator: (val) =>
                                  val.length < 1 && val.length > 1
                                      ? 'Enter valid Name'
                                      : null,
                              onSaved: (val) => na = val,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: new TextFormField(
                              controller: email,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)))),
                              validator: _validateEmail,
                              onSaved: (String value) {
                                e = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: contact,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: "Contact Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)))),
                              validator: _validateContact,
                              onSaved: (String val) => c = val,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: new TextFormField(
                              controller: password,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: _toggle,
                                  ),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                  )),
                              validator: (val) =>
                                  val.length < 6 && val.length > 1
                                      ? 'Password too short.'
                                      : null,
                              onSaved: (val) => paswrd = val,
                              obscureText: op,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: new TextFormField(
                              controller: confirmpass,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: toggle,
                                  ),
                                  hintText: "Confirm Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32)))),
                              validator: (val) =>
                                  val.length < 6 && val.length > 1
                                      ? 'Password too short.'
                                      : null,
                              onSaved: (val) => passwrd = val,
                              obscureText: opc,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: new RaisedButton(
                              onPressed: () {
                                onSubmittedname(name.text);
                                onSubmittedemail(email.text);
                                onSubmittedcontact(contact.text);
                                onSubmittedpassward(password.text);
                                onSubmittedconfirmpass(confirmpass.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new OtpPage()));
                                print("Name is " + names.toString());
                                print("Email is" + e.toString());
                                print("Contact Number" + c.toString());
                                print("password is " + p.toString());
                                print("confirmpass is " + cp.toString());
                              },
                              child: new Text("Register"),
                              color: Colors.black,
                              textColor: Colors.white,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

String _validateContact(String values) {
  int a;
  a = values.length;
  if (a < 1) {
    return null;
  } else if (a == 10)
  // Thise is just a regular expression for email addresses
  {
    RegExp regExp = new RegExp('^' + // No leading content.
            '[-+]?' + // Optional sign.
            '(?:[0-9]{0,30}\\.)?' + // Optionally 0-30 decimal digits of mantissa.
            '[0-9]{1,30}' + // 1-30 decimal digits of integer or fraction.
            '(?:[Ee][-+]?[1-2]?[0-9])?' // No trailing content.
        );
    if (regExp.hasMatch(values)) {
      // So, the email is valid
      return null;
    }
  }
  // The pattern of the email didn't match the regex above.
  return 'Contact number is not valid';
}

String _validateEmail(String value) {
  int l;
  l = value.length;
  if (l < 1) {
    return null;
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);
  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return null;
  }
  // The pattern of the email didn't match the regex above.
  return 'Email is not valid';
}

class apt {
  Widget getappbar() {
    return AppBar(
//      leading: Builder(builder:
//          (context) =>
//          IconButton(
//            icon: new Icon(Icons.settings),
//            onPressed: () {},
//          )),
      actions: <Widget>[
        Container(
            padding: const EdgeInsets.all(8.0), child: Icon(Icons.settings))
        // here add other icon
      ],

      backgroundColor: new Color(0xff292929),
    );
  }
}
