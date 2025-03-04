import 'package:beauty_app_mobile/core/extensions/string_extension.dart';

extension DateExtension on DateTime {
  String get toTime {
    return "${stringNumberWithZero(hour)}:${stringNumberWithZero(minute)}";
  }

  DateTime get toDate {
    return DateTime(year, month, day);
  }

  String dateDashFormat() {
    return "${year.toString()}-${month.toString().formatZeroString()}-${day.toString().formatZeroString()}";
  }

  String toStringDate() {
    return "${day.toString().formatZeroString()}/${month.toString().formatZeroString()}/${year.toString()}";
  }
}

String stringNumberWithZero(int number) {
  return number < 10 ? "0$number" : number.toString();
}
