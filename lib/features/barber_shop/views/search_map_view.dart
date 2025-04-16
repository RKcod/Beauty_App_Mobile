import 'dart:math';

import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/constants/constants.dart';
import 'package:beauty_app_mobile/core/providers/providers.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/filter_salon_map.dart';
import 'package:beauty_app_mobile/models/address_geoapify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SearchMapView extends ConsumerStatefulWidget {
  const SearchMapView({super.key});

  @override
  ConsumerState createState() => SearchMapViewState();
}

class SearchMapViewState extends ConsumerState<SearchMapView> {
  TextEditingController controller = TextEditingController();
  MapboxMap? mapboxMap;

  PointAnnotationManager? pointAnnotationManager;

  _onMapCreated(MapboxMap value) async {
    mapboxMap = value;

    // value.logo.updateSettings(LogoSettings(enabled: false));
    // value.attribution.updateSettings(AttributionSettings(enabled: false));
  }

  _onMapIdleListener(MapIdleEventData data) async {
    if (mapboxMap == null) return;

    var cameraBounds = await mapboxMap!.getBounds();
    print(
      "objects in bounds: ${cameraBounds.bounds.northeast} ${cameraBounds.bounds.southwest}",
    );
  }

  Position createRandomPosition() {
    var random = Random();
    return Position(
      random.nextDouble() * -360.0 + 180.0,
      random.nextDouble() * -180.0 + 90.0,
    );
  }

  Point createRandomPoint() {
    return Point(coordinates: createRandomPosition());
  }

  void createOneAnnotation(PointAnnotationManager manager, Uint8List list) {
    manager.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(0.381457, 6.687337)),
        textField: "custom-icon",
        textOffset: [0.0, -2.0],
        textColor: Colors.red.value,
        iconSize: 1.3,
        iconOffset: [0.0, -5.0],
        symbolSortKey: 10,
        image: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 16),
                    Gap(6),
                    Text(
                      "6391 Elgin St. Celina, Delaware 10299",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: TypeAheadField(
                        controller: controller,
                        transitionBuilder: (context, animation, child) => child,
                        emptyBuilder: (context) => const SizedBox(),
                        builder: (context, controller, focusNode) {
                          return CustomTextfield(
                            controller: controller,
                            focusNode: focusNode,
                            hintText: "Search by Salons",
                            leading: Icon(
                              Icons.search,
                              color: Color(0xffABAAB1),
                            ),
                            onChanged: (_) {
                              setState(() {});
                            },
                            trailing:
                                controller.text.isEmpty
                                    ? null
                                    : IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        controller.clear();
                                        setState(() {});
                                      },
                                      padding: EdgeInsets.all(6),
                                    ),
                          );
                        },
                        itemBuilder: (context, AddressGeoapify suggestion) {
                          return ListTile(title: Text(suggestion.addressLine1));
                        },
                        onSelected: (AddressGeoapify suggestion) async {
                          controller.text = suggestion.addressLine1;
                          FocusManager.instance.primaryFocus?.unfocus();
                          mapboxMap?.setCamera(
                            CameraOptions(
                              center: Point(
                                coordinates: Position(
                                  suggestion.lon,
                                  suggestion.lat,
                                ),
                              ),
                              zoom: 15,
                            ),
                          );
                        },
                        decorationBuilder:
                            (context, child) => Container(
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Color(
                                    0xffABAAB1,
                                  ).withValues(alpha: 0.5),
                                ),
                              ),
                              child: child,
                            ),
                        suggestionsCallback: (value) async {
                          if (value.isEmpty) {
                            return List<AddressGeoapify>.empty();
                          }

                          var response = await ref
                              .read(apiProvider)
                              .launchRequest(
                                endPoint: "",
                                baseUrl:
                                    "https://api.geoapify.com/v1/geocode/autocomplete",
                                method: "GET",
                                queryParams: {
                                  "text": value,
                                  "format": "json",
                                  "apiKey": Constants.geoapifyKey,
                                },
                              );

                          return List<Map<String, dynamic>>.from(
                                response.data["results"],
                              )
                              .map((item) => AddressGeoapify.fromMap(item))
                              .toList();
                        },
                      ),
                    ),
                    Gap(8),
                    IconButton(
                      icon: Icon(MingCute.settings_2_line),
                      onPressed: () {
                        showCustomBottomSheet(
                          context,
                          title: "Filter",
                          body:
                              (ctx, state) => FilterSalonMap(
                                applyFilter: (distance) async {
                                  Navigator.pop(ctx);
                                  var long = 9.70639355677473;
                                  var lat = 4.061348949999999;

                                  var response = await ref
                                      .read(apiProvider)
                                      .launchRequest(
                                        endPoint: "",
                                        baseUrl:
                                            "https://api.geoapify.com/v2/places",
                                        method: "GET",
                                        queryParams: {
                                          "categories": "service.beauty",
                                          "filter":
                                              "circle:$long,$lat,${distance * 1000}",
                                          "biais": "proximity:$long,$lat",
                                          "apiKey": Constants.geoapifyKey,
                                        },
                                      );

                                  var places =
                                      List<Map<String, dynamic>>.from(
                                            response.data["features"],
                                          )
                                          .map(
                                            (item) => AddressGeoapify.fromMap(
                                              item["properties"],
                                            ),
                                          )
                                          .toList();
                                  if (places.isEmpty) return;

                                  pointAnnotationManager?.deleteAll();
                                  bool isGoodZoom = false;
                                  double zoom = 6;
                                  while (!isGoodZoom) {
                                    var bounds = await mapboxMap
                                        ?.coordinateBoundsForCamera(
                                          CameraOptions(
                                            center: Point(
                                              coordinates: Position(long, lat),
                                            ),
                                            zoom: zoom,
                                          ),
                                        );

                                    var listPlacesInsideBox =
                                        places.where((item) {
                                          double north =
                                              bounds!.northeast.coordinates.lat
                                                  .toDouble();
                                          double east =
                                              bounds.northeast.coordinates.lng
                                                  .toDouble();
                                          double south =
                                              bounds.southwest.coordinates.lat
                                                  .toDouble();
                                          double west =
                                              bounds.southwest.coordinates.lng
                                                  .toDouble();
                                          return south <= item.lat &&
                                              item.lat <= north &&
                                              west <= item.lon &&
                                              item.lon <= east;
                                        }).toList();

                                    if (places.length >
                                        listPlacesInsideBox.length) {
                                      isGoodZoom = true;
                                    } else {
                                      zoom += 2;
                                    }
                                  }

                                  print("Le bon zoom $zoom");
                                  mapboxMap?.setCamera(
                                    CameraOptions(
                                      center: Point(
                                        coordinates: Position(long, lat),
                                      ),
                                      zoom: zoom,
                                    ),
                                  );

                                  mapboxMap?.annotations
                                      .createPointAnnotationManager()
                                      .then((value) async {
                                        pointAnnotationManager = value;

                                        final ByteData bytes = await rootBundle
                                            .load(
                                              'assets/symbols/custom-icon.png',
                                            );
                                        final Uint8List list =
                                            bytes.buffer.asUint8List();
                                        // createOneAnnotation(value, list);

                                        List<PointAnnotationOptions> options =
                                            [];
                                        for (var place in places) {
                                          options.add(
                                            PointAnnotationOptions(
                                              geometry: Point(
                                                coordinates: Position(
                                                  place.lon,
                                                  place.lat,
                                                ),
                                              ),
                                              textField: place.addressLine1,
                                              textSize: 11,
                                              textOffset: [0.0, -2.0],
                                              textColor:
                                                  Palette.primaryColor
                                                      .toARGB32(),
                                              iconSize: 1.3,
                                              iconOffset: [0.0, -5.0],
                                              symbolSortKey: 10,
                                              image: list,
                                            ),
                                          );
                                        }
                                        value.createMulti(options);

                                        // var carOptions =
                                        //     <PointAnnotationOptions>[];
                                        // for (var i = 0; i < 20; i++) {
                                        //   carOptions.add(
                                        //     PointAnnotationOptions(
                                        //       geometry: createRandomPoint(),
                                        //       iconImage: "car-15",
                                        //     ),
                                        //   );
                                        // }
                                        // value.createMulti(carOptions);
                                        // value.addOnPointAnnotationClickListener(
                                        //   AnnotationClickListener(),
                                        // );
                                      });
                                },
                              ),
                        );
                      },
                      padding: const EdgeInsets.all(8),
                      splashRadius: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: MapWidget(
              key: ValueKey("mapWidget"),
              gestureRecognizers: {
                Factory(() => EagerGestureRecognizer()),
                // Factory(() => ScaleGestureRecognizer()),
              },
              cameraOptions: CameraOptions(
                center: Point(
                  coordinates: Position(6.0033416748046875, 43.70908256335716),
                ),
                zoom: 14,
              ),
              // styleUri: MapboxStyles.STANDARD,
              onMapCreated: _onMapCreated,
              onMapIdleListener: _onMapIdleListener,
            ),
          ),
          const Gap(72),
        ],
      ),
    );
  }
}

extension on CameraChangedEventData {
  String get debugInfo {
    return "timestamp ${DateTime.fromMicrosecondsSinceEpoch(timestamp)}, camera: ${cameraState.debugInfo}";
  }
}

extension on CameraState {
  String get debugInfo {
    return "lat: ${center.coordinates.lat}, lng: ${center.coordinates.lng}, zoom: ${zoom}, bearing: ${bearing}, pitch: ${pitch}";
  }
}
