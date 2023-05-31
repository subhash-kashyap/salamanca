import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salamanca/models/chat_model.dart';
import 'package:salamanca/widgets/chat_widget.dart';
import '../../services/api_services.dart';
import '../../constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<SaulModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(child: Image.asset("assets/image/bcs_balance_scale.png"),),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      chatIndex: chatList[index].chatIndex,
                      msg: chatList[index].msg,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        focusNode: _focusNode,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        controller: textEditingController,
                        decoration: const InputDecoration.collapsed(
                          hintText: " What can I do for you Ladies?",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                        ),
                        onSubmitted: (value) async {
                          //send message
                          await sendMessage();
                          textEditingController.clear();
                          _focusNode.unfocus();
                        },
                      )),
                      IconButton(
                          onPressed: () async {
                            await sendMessage();
                            textEditingController.clear();
                            _focusNode.unfocus();
                          },
                          icon: Icon(Icons.send))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessage() async {
    try {
      setState(() {
        _isTyping = true;
        chatList.add(
          //Appending user input to the chatlist
          SaulModel(
            msg: textEditingController.text,
            chatIndex: 0,
          ),
        );
      });

      chatList.addAll(
          await APIservice.saulGPT(userPrompt: textEditingController.text));
      setState(() {});
    } catch (e) {
      log('ERROR $e');
    } finally {
      setState(() {
        _isTyping = false;
      });
    }
  }
}
