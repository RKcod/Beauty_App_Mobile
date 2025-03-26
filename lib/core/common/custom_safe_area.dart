import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSafeArea extends StatelessWidget {
  final Widget child;

  const CustomSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: SafeArea(left: false, right: false, child: child),
    );
  }
}
