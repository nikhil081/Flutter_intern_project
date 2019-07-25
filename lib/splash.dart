import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'loginpage.dart';
import 'dart:async';
import 'home.dart';
import 'main.dart';
import 'profile.dart';
import 'settings.dart';
import 'register.dart';
import 'lifestyle_perks.dart';
import 'keycard_status.dart';
import 'building_guide.dart';
import 'refer_a_friend.dart';
import 'events_drawer.dart';
import 'registerguest.dart';
import 'loginpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: VideoSplashScreen(),
    routes: <String, WidgetBuilder>{
      '/loginscreen': (BuildContext context) => new logi(),
      '/mainscreen': (BuildContext context) => new bottom(),
      '/addguestscreen': (BuildContext context) => new RegisterGuest(),
      '/feedsevents': (BuildContext context) => new TabBarDemo(),
      //support route
      '/eventsscreen': (BuildContext context) => new MyHomeevents(),
      //upcoming reservations
      '/buildingscreen': (BuildContext context) => new MyHomebuilding(),
      //companyn profile
      '/lifestylescreen': (BuildContext context) => new MyHomePage(),
      '/keycardscreen': (BuildContext context) => new MyHomekey(),
      '/referscreen': (BuildContext context) => new TabBarDemo(),
      //about
    },
    debugShowCheckedModeBanner: false,
  ));
}

class VideoSplashScreen extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoSplashScreen> {
  VideoPlayerController playerController;
  VoidCallback listener;




  @override
  void initState() {
    super.initState();
    loadData();
    listener = () {
      setState(() {});
    };
    initializeVideo();
    playerController.play();

    loadData();
  }


  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    playerController.removeListener(listener);
    Navigator.of(context).pushReplacementNamed('/loginscreen');
  }

  void initializeVideo() {
    playerController =
        VideoPlayerController.asset('assets/images/aeologic_logo.mp4')
          ..addListener(listener)
          ..setVolume(1.0)
          ..initialize()
          ..play();
  }

  @override
  void deactivate() {
    if (playerController != null) {
      playerController.setVolume(0.0);
      playerController.removeListener(listener);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (playerController != null) playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      new AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            child: (playerController != null
                ? VideoPlayer(
                    playerController,
                  )
                : Container()),
          )),
    ]));
  }
}
