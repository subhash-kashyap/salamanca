import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:salamanca/characters/saul/saul_chat.dart';

class Saul extends StatefulWidget {
  const Saul({super.key});

  @override
  State<Saul> createState() => _SaulState();
}

class _SaulState extends State<Saul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/image/saul.png',
          height: MediaQuery.of(context).size.height / 8,
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          TextButton(
            child: Text("It's all good man"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: ChatScreen(),
      ),
    );
  }
}