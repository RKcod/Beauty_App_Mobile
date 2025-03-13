import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class SalonWidget extends StatelessWidget {
  const SalonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 110,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/image_barber.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jawed Habib",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  Gap(4),
                  Text(
                    "6391 Elgin St. Celina, Delaware 10299",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xffABAAB1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      StarRating(
                        rating: 4.5,
                        allowHalfRating: false,
                        onRatingChanged: null,
                        size: 16,
                        color: Color(0xffFFAB36),
                        emptyIcon: Iconsax.star_bulk,
                        filledIcon: Iconsax.star_bulk,
                      ),
                      Spacer(),
                      Icon(Icons.location_on_outlined, size: 14),
                      Gap(4),
                      Text(
                        "5 km",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
