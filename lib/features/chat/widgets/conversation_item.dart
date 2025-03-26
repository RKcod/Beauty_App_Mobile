import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile_picture.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Angela Young",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10:32",
                        style: const TextStyle(
                          color: Color(0xffABAAB1),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello, How can I help you",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xffABAAB1),
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xffFB3030),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
