import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadMoreText(
            "Axe Hair salon is located in Houston, Virginia was formed in 2003. "
            "Opened with the premise of exceptional service for a fair price, Good Hair "
            "Day Salon is a place where clients can come and relax in a modern, upscale setting.",
            style: TextStyle(),
            trimMode: TrimMode.Length,
            // trimLines: 3,
            trimLength: 120,
            colorClickableText: Colors.pink,
            trimCollapsedText: ' Readmore',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gap(24),
          Text("Opening hours", style: TextStyle(fontFamily: "PoppinsBold")),
          Gap(10),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: List.generate(
              2,
              (index) => Row(
                children: [
                  Text(
                    "Monday - Friday",
                    style: TextStyle(color: Color(0xffABAAB1)),
                  ),
                  Spacer(),
                  Text("8:30 am - 9:30 pm"),
                ],
              ),
            ),
          ),
          Gap(24),
          Text("Contact", style: TextStyle(fontFamily: "PoppinsBold")),
          Gap(10),
          Text(
            "583 463 23 34",
            style: TextStyle(
              color: Color(0xff432BDF),
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff432BDF),
            ),
          ),
        ],
      ),
    );
  }
}
