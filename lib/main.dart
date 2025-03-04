import 'package:beauty_app_mobile/theme/theme_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData();
  final ThemeData darkTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty App',
      debugShowCheckedModeBanner: false,
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1)),
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: child!,
            ),
          ),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.grey),
        bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            // statusBarColor: Palette.primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        textTheme: theme.textTheme.apply(fontFamily: "ParkinsansRegular"),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        textSelectionTheme: ThemeApp.textSelectionTheme,
        pageTransitionsTheme: ThemeApp.pageTransition,
      ),
      darkTheme: darkTheme.copyWith(
        colorScheme: darkTheme.colorScheme.copyWith(secondary: Colors.grey),
        textTheme: theme.textTheme.apply(fontFamily: "ParkinsansRegular"),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textSelectionTheme: ThemeApp.textSelectionTheme,
        pageTransitionsTheme: ThemeApp.pageTransition,
      ),
      themeMode: ThemeMode.light,
      home: Scaffold(),
    );
  }
}
