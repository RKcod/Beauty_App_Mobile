import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/salon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile_picture.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffDFDEE4)),
                    ),
                    child: Center(
                      child: Icon(Icons.notifications_none_outlined),
                    ),
                  ),
                  Gap(10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffDFDEE4)),
                    ),
                    child: Center(child: Icon(Icons.favorite_border)),
                  ),
                ],
              ),
              Gap(20),
              Text(
                "Hi, Jerry Milona",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PoppinsBold",
                ),
              ),
              Gap(4),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Color(0xffABAAB1),
                  ),
                  Gap(6),
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffABAAB1),
                    ),
                  ),
                ],
              ),
              Gap(16),
              CustomTextfield(
                hintText: "Search by Salons",
                leading: Icon(Icons.search, color: Color(0xffABAAB1)),
                trailing: Icon(BoxIcons.bx_filter),
              ),
              Gap(32),
              Row(
                children: [
                  Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFF6C44),
                    ),
                  ),
                ],
              ),
              Gap(12),
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => CircleAvatar(
                        radius: 32,
                        backgroundColor: Palette.primaryColor.withValues(
                          alpha: 0.4,
                        ),
                        child: Icon(
                          MingCute.scissors_2_fill,
                          color: Colors.white,
                        ),
                      ),
                  separatorBuilder: (context, index) => Gap(8),
                  itemCount: 10,
                ),
              ),
              Gap(16),
              Row(
                children: [
                  Text(
                    "Nearest salon",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFF6C44),
                    ),
                  ),
                ],
              ),
              Gap(12),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => SalonWidget(),
                separatorBuilder: (context, index) => Gap(12),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
