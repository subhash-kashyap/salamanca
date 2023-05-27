import 'dart:developer';

import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              color: Colors.green[300],
              child: Center(
                child: Text("It's show time"),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 2,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor,
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    log("pressed");
                  },
                ),
                border: OutlineInputBorder(),
                hintText: 'What can I help you with?',
              ),
              onSubmitted: (value) {
                log("Value $value");
              },
            ),
          ),
        ],
      ),
    );
  }
}
