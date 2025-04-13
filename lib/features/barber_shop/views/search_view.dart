import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/home_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/salon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<String> services = ["All", "Haircuts", "Make Up", "Massage", "Skincare"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                    hintText: "Search by Salons",
                    initialText: "Salon",
                    leading: Icon(Icons.search, color: Color(0xffABAAB1)),
                    trailing: Icon(MingCute.settings_2_line),
                  ),
                ),
                Gap(12),
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              ],
            ),
            Gap(16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color:
                            index == 0
                                ? Palette.primaryColor
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          services[index],
                          style: TextStyle(
                            color:
                                index == 0 ? Colors.white : Color(0xffDFDEE4),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Gap(4),
                itemCount: services.length,
              ),
            ),
            Gap(16),
            Text(
              "Result found(246)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(20),
            Expanded(
              child: ListView.separated(
                itemBuilder:
                    (context, index) => SalonWidget(salon: salons[index % 6]),
                separatorBuilder: (context, index) => Gap(12),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
