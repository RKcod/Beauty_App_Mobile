import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/constants/constants.dart';
import 'package:beauty_app_mobile/core/providers/providers.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/filter_salon_map.dart';
import 'package:beauty_app_mobile/models/address_geoapify.dart';
import 'package:beauty_app_mobile/models/coordinates_model.dart';
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
  final void Function(PointAnnotation annotation) onAnnotationClick;

  AnnotationClickListener({required this.onAnnotationClick});

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id}");
    onAnnotationClick(annotation);
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
  Uint8List? image;
  AddressGeo? selectedPlace;
  List<AddressGeo> places = [];
  AddressGeo? lastItem;

  CameraOptions? previousState;
  PointAnnotation? point;

  bool isLoading = false;

  Future<void> moveMap({required CameraOptions options}) async {
    await pointAnnotationManager?.deleteAll();
    point = null;
    await handleGesture(false);
    await mapboxMap?.flyTo(options, mapAnimation);

    await Future.delayed(const Duration(seconds: 2));
    _onMapIdleListener();
  }

  Future<void> handleGesture(bool active) async {
    return mapboxMap?.gestures.updateSettings(
      GesturesSettings(
        rotateEnabled: active,
        scrollEnabled: active,
        pinchToZoomEnabled: active,
        doubleTapToZoomInEnabled: active,
        doubleTouchToZoomOutEnabled: active,
        quickZoomEnabled: active,
        pitchEnabled: active,
        pinchPanEnabled: active,
      ),
    );
  }

  List<AddressGeo> responsePlaceToAddress(Map<String, dynamic> data) {
    return List<Map<String, dynamic>>.from(
      data["features"],
    ).map((item) => AddressGeo.fromMap(item["properties"])).toList();
  }

  _onMapCreated(MapboxMap value) async {
    mapboxMap = value;

    final ByteData bytes = await rootBundle.load('assets/symbols/marker.png');
    image = bytes.buffer.asUint8List();

    // final ByteData bytes2 = await rootBundle.load(
    //   'assets/symbols/marker_en.png',
    // );
    // var markerEn = bytes2.buffer.asUint8List();

    pointAnnotationManager =
        await value.annotations.createPointAnnotationManager();
    pointAnnotationManager?.addOnPointAnnotationClickListener(
      AnnotationClickListener(
        onAnnotationClick: (annotation) async {
          if (point != null) {
            point!.iconOpacity = 0.5;
            point!.iconSize = 2;
            point!.textField = annotation.textField == "A" ? "B" : "A";
            await pointAnnotationManager?.update(point!);
          }

          annotation.iconOpacity = 1;
          annotation.iconSize = 2.2;
          annotation.textField = annotation.textField == "A" ? "B" : "A";
          await pointAnnotationManager?.update(annotation);

          point = annotation;

          selectedPlace = places.firstWhere(
            (place) =>
                place.lon == annotation.geometry.coordinates.lng &&
                place.lat == annotation.geometry.coordinates.lat,
          );
          print("Selected place : ${selectedPlace?.addressLine1}");

          setState(() {});
        },
      ),
    );
    // value.logo.updateSettings(LogoSettings(enabled: false));
    // value.attribution.updateSettings(AttributionSettings(enabled: false));
  }

  _onCameraChangeListener(CameraChangedEventData data) async {}

  _onMapIdleListener() async {
    if (mapboxMap == null) return;

    if (selectedPlace != null) {
      selectedPlace = null;
      setState(() {});
    }

    var cameraState = await mapboxMap!.getCameraState();
    var cameraBounds = await mapboxMap?.coordinateBoundsForCamera(
      cameraState.toCameraOptions(),
    );
    var coordinates = boundsCoordinate(cameraBounds!);

    pointAnnotationManager?.deleteAll();
    point = null;
    places = [];
    isLoading = true;
    setState(() {});
    await handleGesture(false);

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

      places = responsePlaceToAddress(response.data);

      if (places.isEmpty) return;

      // createOneAnnotation(value, list);

      List<PointAnnotationOptions> options = [];
      for (var place in places) {
        options.add(
          PointAnnotationOptions(
            geometry: Point(coordinates: Position(place.lon, place.lat)),
            iconOpacity: 0.5,
            iconSize: 2,
            iconOffset: [0.0, -5.0],
            symbolSortKey: 10,
            image: image,
            textColor: Colors.transparent.toARGB32(),
          ),
        );
      }
      await pointAnnotationManager?.createMulti(options);
      print("Nombre de places ${places.length}");
    } catch (e) {
      if (!mounted) return;
      showToast(context, content: "Une erreur est survenue");
    } finally {
      handleGesture(true);
      isLoading = false;
      setState(() {});
    }
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
                        9.70639355677473,
                        4.061348949999999,
                      ),
                    ),
                    zoom: 14,
                  ),
                  // styleUri: MapboxStyles.STANDARD,
                  onMapCreated: _onMapCreated,
                  onCameraChangeListener: _onCameraChangeListener,
                  onScrollListener: (context) {
                    if (context.gestureState != GestureState.ended) return;

                    _onMapIdleListener();
                  },
                  onZoomListener: (context) {
                    if (context.gestureState != GestureState.ended) return;

                    _onMapIdleListener();
                  },
                  // onMapIdleListener: _onMapIdleListener,
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
                              itemBuilder: (context, AddressGeo suggestion) {
                                return ListTile(
                                  title: Text(suggestion.addressLine1),
                                );
                              },
                              onSelected: (AddressGeo suggestion) async {
                                lastItem = suggestion;
                                controller.text = suggestion.addressLine1;
                                FocusManager.instance.primaryFocus?.unfocus();

                                moveMap(
                                  options: CameraOptions(
                                    center: Point(
                                      coordinates: Position(
                                        suggestion.lon,
                                        suggestion.lat,
                                      ),
                                    ),
                                    zoom: 14,
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
                                  return List<AddressGeo>.empty();
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
                                    .map((item) => AddressGeo.fromMap(item))
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
                                      lastSearch: lastItem,
                                      applyFilter: (
                                        distance,
                                        aboutLocation,
                                      ) async {
                                        Navigator.pop(ctx);

                                        isLoading = true;
                                        setState(() {});
                                        var long =
                                            aboutLocation == AboutLocation.me
                                                ? 9.70639355677473
                                                : lastItem!.lon;
                                        var lat =
                                            aboutLocation == AboutLocation.me
                                                ? 4.061348949999999
                                                : lastItem!.lat;

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

                                        moveMap(
                                          options: CameraOptions(
                                            center: Point(
                                              coordinates: Position(long, lat),
                                            ),
                                            zoom: zoom - 2,
                                          ),
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
                if (selectedPlace != null)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedPlace!.addressLine1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
