import 'package:flutter/material.dart';

class CustomHeaderSheet extends StatelessWidget {
  final String title;
  final void Function()? additionalActionOnPressed;
  const CustomHeaderSheet(
      {super.key, required this.title, this.additionalActionOnPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0,
          child: IconButton(
              onPressed: () {},
              splashRadius: 16,
              icon: const Icon(Icons.clear)),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {
              additionalActionOnPressed != null
                  ? additionalActionOnPressed!()
                  : Navigator.pop(context);
            },
            splashRadius: 16,
            icon: const Icon(Icons.clear))
      ],
    );
  }
}
