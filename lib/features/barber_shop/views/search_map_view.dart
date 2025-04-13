import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapboxSearch;

mapboxSearch.SearchBoxAPI search = mapboxSearch.SearchBoxAPI(
  apiKey: Constants.mapboxToken,
  limit: 6,
);

class SearchMapView extends StatefulWidget {
  const SearchMapView({super.key});

  @override
  State createState() => SearchMapViewState();
}

class SearchMapViewState extends State<SearchMapView> {
  TextEditingController controller = TextEditingController();
  MapboxMap? mapboxMap;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
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
          Positioned(
            left: 0,
            right: 0,
            child: Container(
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
                  TypeAheadField(
                    controller: controller,
                    transitionBuilder: (context, animation, child) => child,
                    emptyBuilder: (context) => const SizedBox(),
                    builder: (context, controller, focusNode) {
                      return CustomTextfield(
                        controller: controller,
                        focusNode: focusNode,
                        hintText: "Search by Salons",
                        leading: Icon(Icons.search, color: Color(0xffABAAB1)),
                        trailing: Icon(MingCute.settings_2_line),
                      );
                    },
                    itemBuilder: (context, mapboxSearch.Feature suggestion) {
                      return ListTile(
                        title: Text(suggestion.properties.fullAddress ?? ""),
                      );
                    },
                    // listBuilder:
                    //     (context, children) => ListView(children: children),
                    onSelected: (mapboxSearch.Feature suggestion) {
                      mapboxMap?.setCamera(
                        CameraOptions(
                          center: Point(
                            coordinates: Position(
                              suggestion.geometry.coordinates.long,
                              suggestion.geometry.coordinates.lat,
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
                              color: Color(0xffABAAB1).withValues(alpha: 0.5),
                            ),
                          ),
                          child: child,
                        ),
                    suggestionsCallback: (value) async {
                      mapboxSearch.ApiResponse<mapboxSearch.SuggestionResponse>
                      searchPlace = await search.getSuggestions(value);

                      if (searchPlace.success == null) {
                        return List<mapboxSearch.Feature>.empty();
                      }
                      print(
                        "------>Suggestions ${searchPlace.success!.suggestions.length}",
                      );

                      var suggestions = searchPlace.success!.suggestions;
                      List<mapboxSearch.Feature> places = [];

                      for (var suggestion in suggestions) {
                        mapboxSearch.ApiResponse<mapboxSearch.RetrieveResonse>
                        searchPlace = await search.getPlace(
                          suggestion.mapboxId,
                        );

                        if (searchPlace.success == null ||
                            searchPlace.success!.features.isEmpty) {
                          continue;
                        }

                        print(
                          "Place "
                          // "${searchPlace.success?.features.first.properties.coordinates.lcation}",
                        );
                        places.add(searchPlace.success!.features.first);
                      }

                      return places;
                    },
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
