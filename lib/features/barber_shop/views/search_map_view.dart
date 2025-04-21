import 'dart:math';

import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/constants/constants.dart';
import 'package:beauty_app_mobile/core/providers/providers.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/filter_salon_map.dart';
import 'package:beauty_app_mobile/models/address_geoapify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class AnnotationClickListener extends OnPointAnnotationClickListener {
  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id}");
  }
}

class SearchMapView extends ConsumerStatefulWidget {
  const SearchMapView({super.key});

  @override
  ConsumerState createState() => SearchMapViewState();
}

class SearchMapViewState extends ConsumerState<SearchMapView> {
  TextEditingController controller = TextEditingController();
  MapboxMap? mapboxMap;
  var mapAnimation = MapAnimationOptions(duration: 2000, startDelay: 300);
  CoordinateBounds? boundsCamera;

  PointAnnotationManager? pointAnnotationManager;

  bool isLoading = false;

  List<AddressGeoapify> responsePlaceToAddress(Map<String, dynamic> data) {
    return List<Map<String, dynamic>>.from(
      data["features"],
    ).map((item) => AddressGeoapify.fromMap(item["properties"])).toList();
  }

  _onMapCreated(MapboxMap value) async {
    mapboxMap = value;

    // value.logo.updateSettings(LogoSettings(enabled: false));
    // value.attribution.updateSettings(AttributionSettings(enabled: false));
  }

  _onCameraChangeListener(CameraChangedEventData data) async {
    if (mapboxMap == null) return;
    pointAnnotationManager?.deleteAll();

    isLoading = true;
    setState(() {});
    await mapboxMap?.gestures.updateSettings(
      GesturesSettings(
        rotateEnabled: false,
        scrollEnabled: false,
        pinchToZoomEnabled: false,
        doubleTapToZoomInEnabled: false,
        doubleTouchToZoomOutEnabled: false,
        quickZoomEnabled: false,
        pitchEnabled: false,
        pinchPanEnabled: false,
      ),
    );

    var cameraBounds = await mapboxMap?.coordinateBoundsForCamera(
      data.cameraState.toCameraOptions(),
    );
    var coordinates = boundsCoordinate(cameraBounds!);
    print("Camera bounds : $coordinates");

    try {
      var response = await ref
          .read(apiProvider)
          .launchRequest(
            endPoint: "",
            baseUrl: "https://api.geoapify.com/v2/places",
            method: "GET",
            queryParams: {
              "categories": "service.beauty",
              "filter":
                  "rect:${coordinates.west},${coordinates.north},${coordinates.east},${coordinates.south}",
              "apiKey": Constants.geoapifyKey,
            },
          );

      print("Response : ${response.data}");

      var places = responsePlaceToAddress(response.data);

      if (places.isEmpty) return;
      await mapboxMap?.annotations.createPointAnnotationManager().then((
        value,
      ) async {
        pointAnnotationManager = value;

        final ByteData bytes = await rootBundle.load(
          'assets/symbols/custom-icon.png',
        );
        final Uint8List list = bytes.buffer.asUint8List();
        // createOneAnnotation(value, list);

        List<PointAnnotationOptions> options = [];
        for (var place in places) {
          options.add(
            PointAnnotationOptions(
              geometry: Point(coordinates: Position(place.lon, place.lat)),
              textField: place.addressLine1,
              textSize: 11,
              textOffset: [0.0, -2.0],
              textColor: Palette.primaryColor.toARGB32(),
              iconSize: 1.3,
              iconOffset: [0.0, -5.0],
              symbolSortKey: 10,
              image: list,
            ),
          );
        }
        value.createMulti(options);
        value.addOnPointAnnotationClickListener(AnnotationClickListener());
        return;
      });
    } catch (e) {
      if (!context.mounted) return;
      showToast(context, content: "Une erreur est survenue");
    } finally {
      mapboxMap?.gestures.updateSettings(
        GesturesSettings(
          rotateEnabled: true,
          scrollEnabled: true,
          pinchToZoomEnabled: true,
          doubleTapToZoomInEnabled: true,
          doubleTouchToZoomOutEnabled: true,
          quickZoomEnabled: true,
          pitchEnabled: true,
          pinchPanEnabled: true,
        ),
      );
      isLoading = false;
      setState(() {});
    }
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
          Expanded(
            child: Stack(
              children: [
                MapWidget(
                  key: ValueKey("mapWidget"),
                  gestureRecognizers: {
                    Factory(() => EagerGestureRecognizer()),
                    // Factory(() => ScaleGestureRecognizer()),
                  },
                  cameraOptions: CameraOptions(
                    center: Point(
                      coordinates: Position(
                        6.0033416748046875,
                        43.70908256335716,
                      ),
                    ),
                    zoom: 14,
                  ),
                  // styleUri: MapboxStyles.STANDARD,
                  onMapCreated: _onMapCreated,
                  onCameraChangeListener: _onCameraChangeListener,
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 32,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TypeAheadField(
                              controller: controller,
                              transitionBuilder:
                                  (context, animation, child) => child,
                              emptyBuilder:
                                  (context) =>
                                      controller.text.isNotEmpty
                                          ? Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              'Pas de résultats pour cette recherche',
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                          : const SizedBox(),
                              builder: (context, controller, focusNode) {
                                return CustomTextfield(
                                  controller: controller,
                                  focusNode: focusNode,
                                  hintText: "Search by Salons",
                                  backgroundColor: Colors.white,
                                  height: 56,
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
                              itemBuilder: (
                                context,
                                AddressGeoapify suggestion,
                              ) {
                                return ListTile(
                                  title: Text(suggestion.addressLine1),
                                );
                              },
                              onSelected: (AddressGeoapify suggestion) async {
                                controller.text = suggestion.addressLine1;
                                FocusManager.instance.primaryFocus?.unfocus();
                                mapboxMap?.flyTo(
                                  CameraOptions(
                                    center: Point(
                                      coordinates: Position(
                                        suggestion.lon,
                                        suggestion.lat,
                                      ),
                                    ),
                                    zoom: 10,
                                  ),
                                  mapAnimation,
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
                                    .map(
                                      (item) => AddressGeoapify.fromMap(item),
                                    )
                                    .toList();
                              },
                            ),
                          ),
                          Gap(8),
                          GestureDetector(
                            onTap: () {
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

                                        var places = responsePlaceToAddress(
                                          response.data,
                                        );
                                        if (places.isEmpty) return;

                                        bool isGoodZoom = false;
                                        double zoom = 6;
                                        while (!isGoodZoom) {
                                          var bounds = await mapboxMap
                                              ?.coordinateBoundsForCamera(
                                                CameraOptions(
                                                  center: Point(
                                                    coordinates: Position(
                                                      long,
                                                      lat,
                                                    ),
                                                  ),
                                                  zoom: zoom,
                                                ),
                                              );

                                          var listPlacesInsideBox =
                                              places.where((item) {
                                                return placeInBounds(
                                                  place: item,
                                                  bounds: bounds!,
                                                );
                                              }).toList();

                                          if (places.length >
                                              listPlacesInsideBox.length) {
                                            isGoodZoom = true;
                                          } else {
                                            zoom += 2;
                                          }
                                        }
                                        mapboxMap?.flyTo(
                                          CameraOptions(
                                            center: Point(
                                              coordinates: Position(long, lat),
                                            ),
                                            zoom: zoom - 2,
                                          ),
                                          mapAnimation,
                                        );
                                      },
                                    ),
                              );
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Color(
                                    0xffABAAB1,
                                  ).withValues(alpha: 0.5),
                                ),
                              ),
                              child: Center(
                                child: Icon(MingCute.settings_2_line),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16),
                      if (isLoading)
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(child: CupertinoActivityIndicator()),
                        ),
                    ],
                  ),
                ),
              ],
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
