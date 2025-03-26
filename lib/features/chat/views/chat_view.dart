import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(16),
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.west),
                  padding: const EdgeInsets.all(8),
                ),
                Gap(28),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Angela Young",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "PoppinsBold",
                        ),
                      ),
                      Gap(2),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Color(0xff6BE42B),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xffDFDEE4)),
                  ),
                  child: Icon(Icons.call_outlined),
                ),
                Gap(10),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xffDFDEE4)),
                  ),
                  child: Icon(Icons.videocam_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/chat_empty.png"),
                Gap(40),
                Text(
                  "No Messages yet",
                  style: TextStyle(fontSize: 13, color: Color(0xffABAAB1)),
                ),
              ],
            ),
          ),
          Gap(12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Palette.primaryColor.withValues(alpha: 0.05),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xffDFDEE4),
                  child: Center(child: Icon(Icons.add, color: Colors.white)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Write a message",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xffC6C5CD),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.send, color: Palette.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
