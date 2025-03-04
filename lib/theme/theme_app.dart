import 'package:flutter/material.dart';

import '../core/transitions/custom_transition_builder.dart';
import '../core/utils/palette.dart';

class ThemeApp {
  static var pageTransition = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CustomTransitionBuilder()
    },
  );
  static var textSelectionTheme = TextSelectionThemeData(
      cursorColor: Palette.primaryColor,
      selectionColor: Palette.primaryColor.withOpacity(0.5),
      selectionHandleColor: Palette.primaryColor);
}
