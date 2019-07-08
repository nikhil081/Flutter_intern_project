import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'loginpage.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: VideoSplashScreen(),
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
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => logi()));
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
