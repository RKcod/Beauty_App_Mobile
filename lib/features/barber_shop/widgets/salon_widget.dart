import 'package:beauty_app_mobile/models/salon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class SalonWidget extends StatelessWidget {
  final SalonModel salon;
  const SalonWidget({super.key, required this.salon});

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
                image: AssetImage(salon.imageUrl),
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
                    salon.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  Gap(4),
                  Text(
                    salon.address,
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
                        rating: salon.rating,
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
                        "${salon.distance} km",
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
