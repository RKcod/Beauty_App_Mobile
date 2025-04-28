import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/chat/views/chat_view.dart';
import 'package:beauty_app_mobile/features/chat/widgets/conversation_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListConversationsView extends StatefulWidget {
  final ScrollController? controller;
  const ListConversationsView({super.key, this.controller});

  @override
  State<ListConversationsView> createState() => _ListConversationsViewState();
}

class _ListConversationsViewState extends State<ListConversationsView> {
  var itemsTab = ["Messages", "Calls"];
  int selectTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),
            Row(
              children: [
                Text(
                  "2 nouveaux messages",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: Center(child: Icon(Icons.search)),
                ),
                Gap(10),
              ],
            ),
            Gap(30),
            SizedBox(
              height: 40,
              child: Row(
                spacing: 4,
                children: List.generate(
                  itemsTab.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectTabIndex = index;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color:
                              index == selectTabIndex
                                  ? Palette.primaryColor
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            itemsTab[index],
                            style: TextStyle(
                              color:
                                  index == selectTabIndex
                                      ? Colors.white
                                      : Color(0xffDFDEE4),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(32),
            Expanded(
              child: ListView.separated(
                controller: widget.controller,
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatView()),
                        );
                      },
                      child: ConversationItem(),
                    ),
                separatorBuilder: (context, _) => Gap(24),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
