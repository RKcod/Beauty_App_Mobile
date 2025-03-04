import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get heightWithoutPadding {
    return MediaQuery.of(this).size.height -
        MediaQuery.of(this).viewPadding.top ;
  }
}
