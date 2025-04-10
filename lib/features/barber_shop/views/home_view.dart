import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/salon_detail_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/search_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/salon_widget.dart';
import 'package:beauty_app_mobile/models/salon_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

var salons = [
  SalonModel(
    name: "Green Apple",
    address: "6391 Elgin St. Celina, Delaware ...",
    imageUrl: "assets/images/image_barber1.jpg",
    rating: 5,
    distance: 15,
  ),
  SalonModel(
    name: "Jawed Habib",
    address: "8502 Preston Rd. Inglewood, M...",
    imageUrl: "assets/images/image_barber2.jpg",
    rating: 4,
    distance: 22,
  ),
  SalonModel(
    name: "The Galleria",
    address: "4140 Parker Rd. Allentown, New ...",
    imageUrl: "assets/images/image_barber3.jpg",
    rating: 4,
    distance: 48,
  ),
  SalonModel(
    name: "Michael Saldana",
    address: "3891 Ranchview Dr. Richardson,...",
    imageUrl: "assets/images/image_barber4.jpg",
    rating: 3,
    distance: 48,
  ),
  SalonModel(
    name: "Fox and Jane",
    address: "3517 W. Gray St. Utica, Pennsylv...",
    imageUrl: "assets/images/image_barber5.jpg",
    rating: 5,
    distance: 106,
  ),
  SalonModel(
    name: "The Galleria",
    address: "4140 Parker Rd. Allentown, New ...",
    imageUrl: "assets/images/image_barber6.jpg",
    rating: 4,
    distance: 48,
  ),
];

class HomeView extends StatelessWidget {
  final ScrollController? controller;
  const HomeView({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    var iconsService = [
      MingCute.scissors_2_fill,
      Icons.spa,
      Icons.style_rounded,
      Icons.hotel_class_outlined,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
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
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Palette.primaryColor),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ),
                  Gap(10),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Palette.primaryColor),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: Palette.primaryColor,
                      ),
                    ),
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
                    color: Palette.primaryColor,
                  ),
                  Gap(6),
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Palette.primaryColor,
                    ),
                  ),
                ],
              ),
              Gap(16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => SearchView()),
                  );
                },
                child: CustomTextfield(
                  hintText: "Search by Salons",
                  enabled: false,
                  leading: Icon(Icons.search, color: Color(0xffABAAB1)),
                  trailing: Icon(BoxIcons.bx_filter),
                ),
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
                height: 91,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Palette.primaryColor.withValues(
                              alpha: 0.4,
                            ),
                            child: Icon(
                              iconsService[index % 4],
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Gap(12),
                          Text("Haircut", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                  separatorBuilder: (context, index) => Gap(16),
                  itemCount: 10,
                ),
              ),
              Gap(32),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "-40%",
                          style: TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PoppinsBold",
                          ),
                        ),
                        Gap(4),
                        Text(
                          "Vourcher for you next\nhaircut service",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(24),
                        CustomButton(text: "Book now"),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/ad_image.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(32),
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
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SalonDetailView(),
                          ),
                        );
                      },
                      child: SalonWidget(salon: salons[index]),
                    ),
                separatorBuilder: (context, index) => Gap(12),
                itemCount: salons.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
