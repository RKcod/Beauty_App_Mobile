import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Write your review", style: TextStyle(fontSize: 13)),
              StarRating(
                rating: 0,
                allowHalfRating: false,
                onRatingChanged: null,
                size: 16,
                color: Color(0xffFFAB36),
                emptyIcon: Iconsax.star_bulk,
                filledIcon: Iconsax.star_bulk,
              ),
            ],
          ),
          Gap(16),
          CustomTextfield(
            hintText: "Leave your experience...",
            leading: Icon(CupertinoIcons.photo, color: Color(0xffABAAB1)),
            trailing: Icon(Icons.send, color: Palette.primaryColor),
          ),
          Gap(16),
          Text(
            "All reviews(76)",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Gap(20),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder:
                (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(
                              "assets/images/profile_picture.png",
                            ),
                          ),
                          Gap(12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Vicky Pirachel",
                                        style: TextStyle(
                                          fontFamily: "PoppinsBold",
                                        ),
                                      ),
                                      Text(
                                        "2 days ago",
                                        style: TextStyle(
                                          color: Color(0xffABAAB1),
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      StarRating(
                                        rating: 4,
                                        allowHalfRating: false,
                                        onRatingChanged: null,
                                        size: 10,
                                        color: Color(0xffFFAB36),
                                        emptyIcon: Iconsax.star_bulk,
                                        filledIcon: Iconsax.star_bulk,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(8),
                    Text(
                      "I asked for I simple cut and showed the photo about what I was "
                      "looking for. At the end I got an uneven cut which made me unhappy,"
                      " as you can see my hair  looks horrible .😩",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
            separatorBuilder: (context, _) => Gap(24),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
