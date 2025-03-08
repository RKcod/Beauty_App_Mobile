import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final void Function()? onChanged;
  final String? text;
  final Widget? widget;
  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.text,
    this.widget,
  });
  // : assert(
  //     text == null && widget == null,
  //     'Text or Widget must have a value',
  //   )

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CheckboxTheme(
              data: const CheckboxThemeData(
                side: BorderSide(color: Palette.primaryColor, width: 1.5),
              ),
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Palette.primaryColor,
                value: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                onChanged: (bool? newValue) {
                  if (onChanged != null) {
                    onChanged!();
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child:
                text != null
                    ? Text(
                      text!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    : widget!,
          ),
        ],
      ),
    );
  }
}
