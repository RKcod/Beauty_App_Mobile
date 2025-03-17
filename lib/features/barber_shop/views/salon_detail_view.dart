import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/about_section.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/package_section.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/review_section.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/share_section.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/specialist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SalonDetailView extends StatefulWidget {
  const SalonDetailView({super.key});

  @override
  State<SalonDetailView> createState() => _SalonDetailViewState();
}

class _SalonDetailViewState extends State<SalonDetailView> {
  ScrollController scrollController = ScrollController();
  bool showTitleAppBar = false;
  final expandedBarHeight = 340.0;
  final collapsedBarHeight = 60.0;
  bool isBouncing = true;

  List<String> sections = ["About", "Services", "Package", "Gallery", "Review"];
  int selectTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: (notification) {
          isBouncing = scrollController.offset < 50;
          showTitleAppBar =
              scrollController.offset >
              (expandedBarHeight - collapsedBarHeight) + 20;
          setState(() {});

          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics:
              isBouncing ? BouncingScrollPhysics() : ClampingScrollPhysics(),
          slivers: [
            SliverStack(
              children: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor:
                      showTitleAppBar ? Palette.primaryColor : Colors.white,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  leading: Icon(Icons.west, color: Colors.white),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ],
                  title:
                      showTitleAppBar
                          ? Text(
                            "Jawed Habib",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                          : null,
                  expandedHeight: expandedBarHeight,
                  collapsedHeight: collapsedBarHeight,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/ad_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                    ],
                  ),
                ),
                SliverPositioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Visibility(
                    visible: !showTitleAppBar,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Jawed Habib",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PoppinsBold",
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: Color(0xff4DC41F),
                        ),
                        Gap(4),
                        Text(
                          "Open",
                          style: TextStyle(
                            color: Color(0xff4DC41F),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Gap(4),
                    Text(
                      "6391 Elgin St. Celina, Delaware 10299",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff5E5D65),
                      ),
                    ),
                    Gap(14),
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
                        Gap(10),
                        Text(
                          "(76 Reviews)",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffABAAB1),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            Icon(Icons.travel_explore),
                            Text("Website", style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            Icon(Icons.call_outlined),
                            Text("Call", style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Direction", style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showCustomBottomSheet(
                              context,
                              body: ShareSection(),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 6,
                            children: [
                              Icon(Icons.share),
                              Text("Share", style: TextStyle(fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(24),
                    Text(
                      "Salon specialists",
                      style: TextStyle(fontSize: 15, fontFamily: "PoppinsBold"),
                    ),
                    Gap(16),
                    SizedBox(
                      height: 115,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SpecialistWidget(),
                        separatorBuilder: (context, _) => Gap(20),
                        itemCount: 8,
                      ),
                    ),
                    Gap(30),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:
                            (context, index) => GestureDetector(
                              onTap: () {
                                selectTabIndex = index;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInOut,
                                height: 40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      index == selectTabIndex
                                          ? Palette.primaryColor
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: Text(
                                    sections[index],
                                    style: TextStyle(
                                      color:
                                          index == selectTabIndex
                                              ? Colors.white
                                              : Color(0xffDFDEE4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => Gap(4),
                        itemCount: sections.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: switch (selectTabIndex) {
                2 => PackageSection(),
                4 => ReviewSection(),
                _ => AboutSection(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
