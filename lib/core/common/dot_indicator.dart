import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int length;
  final int selectedIndex;
  final Color dotSelectedColor;
  final Color dotUnselectedColor;

  const DotIndicator(
      {super.key,
      required this.length,
      required this.selectedIndex,
      required this.dotSelectedColor,
      required this.dotUnselectedColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          length,
          (index) => Padding(
                padding: EdgeInsets.only(right: index == length - 1 ? 0 : 8),
                child: Container(
                  height: 10,
                  width: 10,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? dotSelectedColor
                          : dotUnselectedColor,
                      shape: BoxShape.circle),
                ),
              )),
    );
  }
}
