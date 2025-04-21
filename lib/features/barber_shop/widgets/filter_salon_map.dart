import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_radio.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/models/address_geoapify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

enum AboutLocation { me, lastSearch }

class FilterSalonMap extends StatefulWidget {
  final AddressGeo? lastSearch;
  final void Function(double distance, AboutLocation aboutLocation) applyFilter;
  const FilterSalonMap({super.key, this.lastSearch, required this.applyFilter});

  @override
  State<FilterSalonMap> createState() => _FilterSalonMapState();
}

class _FilterSalonMapState extends State<FilterSalonMap> {
  double distance = 1;
  AboutLocation aboutLocation = AboutLocation.me;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services:",
              style: TextStyle(fontSize: 15, fontFamily: "PoppinsBold"),
            ),
            Gap(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  for (var i = 0; i < 3; i++)
                    Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color:
                            i == 0 ? Palette.primaryColor : Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        switch (i) {
                          0 => "Hairdresser",
                          1 => "Spa",
                          2 => "Massage",
                          _ => "",
                        },
                        style: TextStyle(
                          fontSize: 13,
                          color: i == 0 ? Colors.white : Color(0xffC6C5CD),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Gap(30),
            Text(
              "Rating:",
              style: TextStyle(fontSize: 15, fontFamily: "PoppinsBold"),
            ),
            Gap(12),
            Row(
              children: [
                StarRating(
                  rating: 4,
                  allowHalfRating: false,
                  onRatingChanged: null,
                  size: 16,
                  color: Color(0xffFFAB36),
                  emptyIcon: Iconsax.star_bulk,
                  filledIcon: Iconsax.star_bulk,
                ),
                Gap(20),
                Text("4.0 Stars"),
              ],
            ),
            Gap(30),
            Text(
              "Distance:",
              style: TextStyle(fontSize: 15, fontFamily: "PoppinsBold"),
            ),
            Gap(12),
            SliderTheme(
              data: SliderThemeData(
                // https://stackoverflow.com/questions/76485032/creating-a-custom-shape-for-slider-thumb-in-flutter-slider-and-rangeslider
                overlayColor: Colors.transparent,
                thumbColor: Palette.primaryColor,
                activeTrackColor: Palette.primaryColor,
                inactiveTrackColor: Palette.primaryColor.withValues(alpha: 0.4),
                valueIndicatorColor: Palette.primaryColor,
                activeTickMarkColor: Colors.transparent,
                inactiveTickMarkColor: Colors.transparent,
                showValueIndicator: ShowValueIndicator.always,
                valueIndicatorShape: DropSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: distance,
                min: 1,
                max: 10,
                label: "${distance.toStringAsFixed(0)} km",
                divisions: 10,
                onChanged: (value) {
                  distance = value;
                  setState(() {});
                },
              ),
            ),
            Gap(30),
            Text(
              "Par rapport à :",
              style: TextStyle(fontSize: 15, fontFamily: "PoppinsBold"),
            ),
            Gap(12),
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: CustomRadio<AboutLocation>(
                    value: AboutLocation.me,
                    groupValue: aboutLocation,
                    onChanged: (value) {
                      aboutLocation = value!;
                      setState(() {});
                    },
                    text: "Moi",
                  ),
                ),
                Gap(16),
                Expanded(
                  child: Stack(
                    children: [
                      CustomRadio<AboutLocation>(
                        value: AboutLocation.lastSearch,
                        groupValue: aboutLocation,
                        isDisabled: widget.lastSearch == null,
                        onChanged: (value) {
                          aboutLocation = value!;
                          setState(() {});
                        },
                        text: "Ma dernière recherche",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(30),
            CustomButton(
              text: "Apply filter",
              isFullWidth: true,
              onPressed: () {
                widget.applyFilter(distance, aboutLocation);
              },
            ),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
