import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DingDing());
}

class DingDing extends StatefulWidget {
  DingDing({super.key});

  @override
  State<DingDing> createState() => _DingDingState();
}

class _DingDingState extends State<DingDing> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrBa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        body: Center(
          child: InkWell(
            enableFeedback: false,
            onTap: () async {
              log("Ding Pressed");
              await player.setAsset("assets/audio/hector_salamanca.mp3");
              await player.play();
            },
            // onDoubleTap: () async {
            //   log("Ding Pressed twice");
            //   await player.setAsset("assets/audio/hector_salamanca.mp3");
            //   // await player.setLoopMode(LoopMode.one);
            //   await player.play();
            //   await player.play();
            //   // await player.stop();
            // },
            child: Image.asset(
              "assets/image/hector_salamanca_bell.png",
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
