import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class ShareSection extends StatelessWidget {
  const ShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Column(
        children: [
          Text(
            "Share to",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Gap(30),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              mainAxisExtent: 85,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffDFDEE4)),
                    ),
                    child: Center(child: Brand(Brands.google, size: 20)),
                  ),
                  Text("Gmail", style: TextStyle(fontSize: 12)),
                ],
              ),
              childCount: 6,
            ),
          ),
          Gap(16),
        ],
      ),
    );
  }
}
