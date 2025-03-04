import 'package:beauty_app_mobile/core/extensions/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? date;
  final Function(DateTime) onDateChanged;
  const CustomDatePicker(
      {super.key, required this.date, required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var datePick = await showRoundedDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
          borderRadius: 16,
          styleDatePicker: MaterialRoundedDatePickerStyle(
              paddingDatePicker: const EdgeInsets.only(top: 16)),
          theme: ThemeData(primarySwatch: Colors.green),
        );

        if (datePick != null) {
          onDateChanged(datePick);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26)),
        child: Text(
          date == null ? "JJ/MM/AAAA" : date!.toStringDate(),
          style: TextStyle(color: date == null ? Colors.black54 : null),
        ),
      ),
    );
  }
}
