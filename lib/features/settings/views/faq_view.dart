import 'package:beauty_app_mobile/features/settings/widgets/settings_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  List<bool> expandedStates = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SettingsTitle(title: "FAQs"),
            ),
            Gap(24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(color: Color(0xffEFEFEF)),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => Theme(
                            data: ThemeData(splashColor: Colors.transparent),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(),
                              title: const Text(
                                'How much does this cost?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PoppinsRegular",
                                ),
                              ),
                              trailing: Icon(
                                expandedStates[index]
                                    ? Icons.remove
                                    : Icons.add,
                                color: Color(0xffABAAB1),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    "We provide high end services without the high end price. "
                                    "A moderate price allows us to provide the high end services"
                                    " you enjoy and the lower price allows you to enjoy it more "
                                    "often! Prices for services are subject to consultation.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff5E5D65),
                                      fontFamily: "PoppinsRegular",
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(
                                  () => expandedStates[index] = expanded,
                                );
                              },
                            ),
                          ),
                      separatorBuilder:
                          (context, _) => Divider(color: Color(0xffEFEFEF)),
                      itemCount: 5,
                    ),
                    Divider(color: Color(0xffEFEFEF)),
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
