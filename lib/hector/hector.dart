import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:salamanca/hector/reel.dart';

class Hector extends StatefulWidget {
  const Hector({super.key});

  @override
  State<Hector> createState() => _HectorState();
}

class _HectorState extends State<Hector> {
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
            log("Ding Pressed");
            await player.setAsset("assets/audio/hector_salamanca.mp3");
            await player.play();
          },
          onLongPress: () async {
            log("Ding Pressed twice");
            gusDeath(context);
          },
          child: Image.asset(
            "assets/image/hector_salamanca_bell.png",
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
