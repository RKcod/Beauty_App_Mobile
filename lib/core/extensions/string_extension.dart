import 'package:flutter/material.dart';


extension StringExtension on String {
  String formatZeroString() {
    return length == 1 ? "0$this" : this;
  }

  int toInt() {
    return int.parse(this);
  }

  DateTime toDate() {
    var partsDate = split("-");
    return DateTime(
        partsDate[0].toInt(), partsDate[1].toInt(), partsDate[2].toInt());
  }

  String capitalize() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String passwordFormat() {
    return "*" * length;
  }

  bool get isOnlyDigit {
    for (var i = 0; i < length; i++) {
      try {
        int.parse(this[i]);
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  bool isEmail() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(this);
  }

  bool isFileAccepted() {
    return endsWith(".jpg") ||
        endsWith(".jpeg") ||
        endsWith(".png") ||
        endsWith(".pdf");
  }

  Color colorAvatar() {
    switch (this[0].toLowerCase()) {
      case 'a':
        return const Color(0xff483D8B);
      case 'b':
        return const Color(0xff2F4F4F);
      case 'c':
        return const Color(0xff000000);
      case 'd':
        return const Color(0xff0000FF);
      case 'e':
        return const Color(0xff8A2BE2);
      case 'f':
        return const Color(0xffA52A2A);
      case 'g':
        return const Color(0xffD2691E);
      case 'h':
        return const Color(0xffDC143C);
      case 'i':
        return const Color(0xff00008B);
      case 'j':
        return const Color(0xff008B8B);
      case 'k':
        return const Color(0xffB8860B);
      case 'l':
        return const Color(0xff006400);
      case 'm':
        return const Color(0xff8B008B);
      case 'n':
        return const Color(0xff8B0000);
      case 'o':
        return const Color(0xff808080);
      case 'p':
        return const Color(0xffFF69B4);
      case 'q':
        return const Color(0xff4B0082);
      case 'r':
        return const Color(0xffBA55D3);
      case 's':
        return const Color(0xff0000CD);
      case 't':
        return const Color(0xff3CB371);
      case 'u':
        return const Color(0xff7B68EE);
      case 'v':
        return const Color(0xff00FF7F);
      case 'w':
        return const Color(0xff00FFFF);
      case 'x':
        return const Color(0xff7FFF00);
      case 'y':
        return const Color(0xffD2691E);
      case 'z':
        return const Color(0xffFF7F50);
      default:
        return Colors.black;
    }
  }
}
