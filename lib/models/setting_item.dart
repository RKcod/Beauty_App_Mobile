import 'package:flutter/material.dart';

class SettingItem {
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  SettingItem({required this.icon, required this.text, this.onPressed});
}
