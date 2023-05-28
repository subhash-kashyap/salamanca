import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:salamanca/characters/hector/reel.dart';

class Twins extends StatefulWidget {
  const Twins({super.key});

  @override
  State<Twins> createState() => _TwinsState();
}

class _TwinsState extends State<Twins> {
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
    return Scaffold(
      body: Center(
        child: InkWell(
          enableFeedback: false,
          onTap: () async {
            log("Meth Pressed");
            await player.setAsset("assets/audio/hector_salamanca.mp3");
            await player.play();
          },
          onLongPress: () async {
            log("Meth Pressed long");
            gusDeath(context);
          },
          child: Image.asset(
            "assets/image/ww.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

gusDeath(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CharacterReel(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
