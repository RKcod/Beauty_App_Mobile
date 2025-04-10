import 'package:beauty_app_mobile/core/packages/water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/appointments/views/appointment_list_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/home_view.dart';
import 'package:beauty_app_mobile/features/chat/views/list_conversations_view.dart';
import 'package:beauty_app_mobile/features/settings/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  var pages = [
    HomeView(),
    HomeView(),
    AppointmentListView(),
    ListConversationsView(),
    ProfileView(),
  ];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        fit: StackFit.expand,
        borderRadius: BorderRadius.circular(12),
        duration: Duration(milliseconds: 300),
        curve: Curves.decelerate,
        showIcon: false,
        width: MediaQuery.of(context).size.width,
        barColor: Colors.transparent,

        start: 2,
        end: 0,
        offset: 0,
        barAlignment: Alignment.bottomCenter,
        body:
            (context, controller) => switch (selectedIndex) {
              0 => HomeView(controller: controller),
              1 => HomeView(controller: controller),
              2 => AppointmentListView(controller: controller),
              3 => ListConversationsView(controller: controller),
              4 => ProfileView(controller: controller),
              _ => SizedBox(),
            },
        child: WaterDropNavBar(
          backgroundColor: Colors.white,
          waterDropColor: Palette.primaryColor,
          inactiveIconColor: Colors.black54,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              text: "Home",
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              text: "Salons",
              filledIcon: Icons.location_on,
              outlinedIcon: Icons.location_on_outlined,
            ),
            BarItem(
              text: "Meetings",
              filledIcon: Icons.calendar_month,
              outlinedIcon: Icons.calendar_month_outlined,
            ),
            BarItem(
              text: "Chat",
              filledIcon: Icons.chat,
              outlinedIcon: Icons.chat_outlined,
            ),
            BarItem(
              text: "Profil",
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   indicatorColor: Palette.primaryColor,
      //   backgroundColor: Colors.white,
      //   labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return TextStyle(color: Palette.primaryColor, fontSize: 13);
      //     }
      //     return TextStyle(fontSize: 11);
      //   }),
      //   selectedIndex: selectedIndex,
      //   onDestinationSelected: (value) => setState(() => selectedIndex = value),
      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(Icons.home_outlined),
      //       selectedIcon: Icon(Icons.home, color: Colors.white),
      //       label: "Home",
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.location_on_outlined),
      //       selectedIcon: Icon(Icons.location_on, color: Colors.white),
      //       label: "Salons",
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.calendar_month_outlined),
      //       selectedIcon: Icon(Icons.calendar_month, color: Colors.white),
      //       label: "Meetings",
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.chat_outlined),
      //       selectedIcon: Icon(Icons.chat, color: Colors.white),
      //       label: "Chat",
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.person_outline),
      //       selectedIcon: Icon(Icons.person, color: Colors.white),
      //       label: "Profil",
      //     ),
      //   ],
      // ),
    );
  }
}
