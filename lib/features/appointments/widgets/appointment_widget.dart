import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/enums/enums.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentWidget extends StatefulWidget {
  final AppointmentStatus status;
  const AppointmentWidget({super.key, required this.status});

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  bool remindAppointment = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffEFEFEF)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "24 September 2021, 16:30",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Gap(10),
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 104,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage("assets/images/package_image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Green Apple"),
                      Text(
                        "8502 Preston Rd. Inglewo 8502 Preston Rd. Inglewo",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xffABAAB1),
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Services: Regular haircut, Classic shaving",
                        style: TextStyle(
                          color: Color(0xffE75A5A),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(16),
          SizedBox(
            height: 30,
            child:
                widget.status == AppointmentStatus.upcoming
                    ? Row(
                      children: [
                        SizedBox(
                          width: 36,
                          height: 24,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: CupertinoSwitch(
                              value: remindAppointment,
                              activeTrackColor: Palette.primaryColor,
                              onChanged: (_) {
                                remindAppointment = !remindAppointment;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Gap(10),
                        Text("Remind me", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        CustomButton(
                          text: "Cancel",
                          transparent: true,
                          colorText: Colors.red,
                          border: BorderSide(color: Colors.red),
                          radius: 8,
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "Review",
                          transparent: true,
                          colorText: Colors.black,
                          border: BorderSide(color: Colors.black),
                          radius: 8,
                        ),
                        Gap(10),
                        CustomButton(text: "Reschedule", radius: 8),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
