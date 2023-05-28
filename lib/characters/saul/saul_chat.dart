import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salamanca/widgets/chat_widget.dart';

import '../../constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(child: Image.asset("assets/image/bcs_balance_scale.png"),),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      chatIndex: int.parse(
                          chatMessages[index]["chatIndex"].toString()),
                      msg: chatMessages[index]["msg"].toString(),
                    );
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.black,
                size: 18,
              )
            ],
            SizedBox(
              height: 12,
            ),
            Material(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      controller: textEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: " What can I do you for Ladies?",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      onSubmitted: (value) {
                        //send message
                      },
                    )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.send))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
