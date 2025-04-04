import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/appointments/views/appointment_start_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    var services = [
      "Hairstyling",
      "Nail",
      "Hair color",
      "Body Glowing",
      "Facial",
      "Spa",
      "Eyebrows",
      "Make up",
      "Retouch",
      "Corner Lashes",
    ];

    return SliverList.builder(
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 20),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
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
                        Text(
                          "Bridal Beauty Makeup",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "PoppinsBold",
                          ),
                        ),
                        Gap(4),
                        Text(
                          "Completed Package Offer till sep 18,2021",
                          style: TextStyle(
                            color: Color(0xffABAAB1),
                            fontSize: 13,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$280.30",
                              style: TextStyle(
                                color: Color(0xff432BDF),
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: CustomButton(
                                text: "Book now",
                                onPressed: () {
                                  showCustomBottomSheet(
                                    context,
                                    body:
                                        (ctx, state) => Material(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 136,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/package_image.jpg",
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Gap(16),
                                                Text(
                                                  "Bridal Beauty Makeup",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: "PoppinsBold",
                                                  ),
                                                ),
                                                Gap(6),
                                                Text(
                                                  "Completed Package Offer till sep 18,2021",
                                                  style: TextStyle(
                                                    color: Color(0xffABAAB1),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Gap(20),
                                                Text(
                                                  "Women want ro feel  attractive. We offer "
                                                  "timeless beauty package to accentuate their "
                                                  "natural beauty so they can feel beautiful "
                                                  "in every day.",
                                                ),
                                                Gap(30),
                                                Text(
                                                  "Service",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: "PoppinsBold",
                                                  ),
                                                ),
                                                Gap(16),
                                                GridView.custom(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 8,
                                                        crossAxisSpacing: 8,
                                                        mainAxisExtent: 30,
                                                      ),
                                                  childrenDelegate:
                                                      SliverChildBuilderDelegate(
                                                        (context, index) => Row(
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              color: Color(
                                                                0xff4DC41F,
                                                              ),
                                                            ),
                                                            Gap(6),
                                                            Text(
                                                              services[index %
                                                                  8],
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        childCount:
                                                            services.length * 3,
                                                      ),
                                                ),
                                                Gap(30),
                                                CustomButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$280.30",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "BOOK NOW",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(ctx);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                AppointmentStartView(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Gap(16),
                                              ],
                                            ),
                                          ),
                                        ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      itemCount: 10,
    );
  }
}
