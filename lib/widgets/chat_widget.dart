import 'package:flutter/material.dart';
import 'package:salamanca/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: chatIndex == 1
                ? BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (chatIndex == 1) ...[
                    // Saul
                    Expanded(
                      child: TextWidget(
                        label: msg,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Image.asset(
                      "assets/image/saulsplaining.png",
                      width: 70,
                      height: 70,
                    ),
                  ] else ...[
                    Image.asset(
                      "assets/image/ww.png",
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: TextWidget(
                        label: msg,
                        color: Colors.black,
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
