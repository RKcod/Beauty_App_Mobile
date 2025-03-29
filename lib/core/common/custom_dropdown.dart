import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? title;
  final List<String> options;
  final String hint;
  final void Function(String?)? onChanged;
  final String? value;
  const CustomDropdown({
    super.key,
    required this.options,
    this.title,
    required this.hint,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "PoppinsBold",
              ),
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField<String>(
                items:
                    options
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        )
                        .toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF2F2F2),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: value,
                isExpanded: true,
                hint: Text(hint),
                onChanged: onChanged,
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
