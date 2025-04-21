import 'package:beauty_app_mobile/core/enums/enums.dart';
import 'package:beauty_app_mobile/models/address_geoapify.dart';
import 'package:beauty_app_mobile/models/coordinates_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

import '../common/custom_header_sheet.dart';
import '../packages/sliding_sheet/sliding_sheet.dart';

void handleHttpError(BuildContext context, HttpErrorType error) {
  if (error == HttpErrorType.connectionTimeout) {
    showToast(context, content: "La requête prend trop de temps. Réessayez");
  } else if (error == HttpErrorType.socketException) {
    showToast(context, content: "Vérifiez votre connexion internet");
  }
}

Future<void> ensureVisibleOnTextArea({required GlobalKey textfieldKey}) async {
  final keyContext = textfieldKey.currentContext;
  if (keyContext != null) {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (keyContext.mounted) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      }
    });
  }
}

CoordinatesModel boundsCoordinate(mapbox.CoordinateBounds bounds) {
  double north = bounds.northeast.coordinates.lat.toDouble();
  double east = bounds.northeast.coordinates.lng.toDouble();
  double south = bounds.southwest.coordinates.lat.toDouble();
  double west = bounds.southwest.coordinates.lng.toDouble();
  return CoordinatesModel(north, east, south, west);
}

bool placeInBounds({
  required AddressGeo place,
  required mapbox.CoordinateBounds bounds,
}) {
  var coordinates = boundsCoordinate(bounds);

  return coordinates.south <= place.lat &&
      place.lat <= coordinates.north &&
      coordinates.west <= place.lon &&
      place.lon <= coordinates.east;
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print("Les services sont activés : $serviceEnabled");
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  print("Permission : $permission");
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  print("Je suis ici");
  // Geolocator.getLastKnownPosition();
  return await Geolocator.getCurrentPosition();
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(content, style: const TextStyle(color: Colors.white)),
    ),
  );
}

void showToast(
  BuildContext context, {
  String content = "Une erreur est survenue",
  bool isError = true,
}) {
  var fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: isError ? Colors.redAccent : Colors.greenAccent,
      ),
      alignment: Alignment.center,
      child: Text(content, style: const TextStyle(color: Colors.white)),
    ),
    positionedToastBuilder: (context, child, gravity) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 2),
  );
}

void showCustomBottomSheet(
  BuildContext context, {
  String? title,
  Widget Function(BuildContext, SheetState)? body,
  Widget Function(BuildContext, ScrollController, SheetState)? customBuilder,
}) {
  showSlidingBottomSheet(
    context,
    builder:
        (builder) => SlidingSheetDialog(
          avoidStatusBar: true,
          duration: const Duration(milliseconds: 500),
          snapSpec: const SnapSpec(snappings: [0, 0.6, 1]),
          backdropColor: Colors.black.withValues(alpha: 0.6),
          cornerRadius: 20,
          cornerRadiusOnFullscreen: 0,
          headerBuilder:
              (context, state) => Material(
                color: Colors.white,
                child:
                    title == null
                        ? SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: Center(
                            child: Container(
                              width: 56,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        )
                        : CustomHeaderSheet(title: title),
              ),
          builder: body,
          customBuilder: customBuilder,
        ),
  );
}
