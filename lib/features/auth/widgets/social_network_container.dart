import 'package:flutter/material.dart';

class SocialNetworkContainer extends StatelessWidget {
  final Widget socialNetworkLogo;
  final void Function()? onPressed;
  const SocialNetworkContainer({
    super.key,
    required this.socialNetworkLogo,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffDFDEE4)),
        ),
        child: Center(child: socialNetworkLogo),
      ),
    );
  }
}
