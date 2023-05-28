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
        Material(
          color: chatIndex == 0 ? Colors.transparent : Colors.black38,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if (chatIndex == 1) ...[
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
                ],
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: TextWidget(
                    label: msg,
                    color: chatIndex == 0 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
