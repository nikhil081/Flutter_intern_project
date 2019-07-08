import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'loginpage.dart';

class OtpPage extends StatefulWidget {
  @override
  State createState() => new OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  TextEditingController controller = TextEditingController();
  String thisText = "";

  @override
  void dispose() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: new apt().getappbar(),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: height * 0.1,
              ),
              Row(
                children: <Widget>[
                  new Container(
                    width: width * 0.1,
                  ),
                  Expanded(
                    child: Text(
                        "Enter the 4-digit code sent to you at +917210551846",
                        style: TextStyle(fontSize: 20)),
                  )
                ],
              ),

//              Padding(
//                padding: const EdgeInsets.only(bottom: 60.0),
//                child: Text(thisText, style: Theme.of(context).textTheme.title),
//              ),
              Row(
                children: <Widget>[
                  Container(
                    width: width * 0.1,
                  ),
                  PinCodeTextField(
                    autofocus: false,
                    controller: controller,
                    hideCharacter: true,
                    highlight: true,
                    highlightColor: Colors.blue,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.green,
                    maskCharacter: "😎",
                    onDone: (text) {
                      print("DONE $text");
                    },
                    pinCodeTextFieldLayoutType:
                        PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                    wrapAlignment: WrapAlignment.start,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 30.0),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
//                    MaterialButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
//                      child: Text("+"),
//                      onPressed: () {
//                        setState(() {
//                          this.pinLength++;
//                        });
//                      },
//                    ),
//                    MaterialButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
//                      child: Text("-"),
//                      onPressed: () {
//                        setState(() {
//                          this.pinLength--;
//                        });
//                      },
//                    ),
                    MaterialButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          this.thisText = controller.text;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new logi()));
                      },
                    ),
//                    MaterialButton(
//                      color: Colors.red,
//                      textColor: Colors.white,
//                      child: Text("SUBMIT Error"),
//                      onPressed: () {
//                        setState(() {
//                          this.hasError = true;
//                        });
//                      },
//                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
