import 'package:async/async.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/providers/providers.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/bottom_navigation_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddressLocationView extends ConsumerStatefulWidget {
  const AddressLocationView({super.key});

  @override
  ConsumerState<AddressLocationView> createState() =>
      _AddressLocationViewState();
}

class _AddressLocationViewState extends ConsumerState<AddressLocationView> {
  var results = [];
  bool isLoading = false;
  bool isError = false;
  String searchText = "";

  CancelableOperation? fetchAddressOperation;

  Future<void> onSearch(String value) async {
    try {
      isLoading = true;
      isError = false;
      setState(() {});

      var responseData = await ref
          .read(apiProvider)
          .launchRequest(
            baseUrl:
                "https://nominatim.openstreetmap.org/search?format=json&q=$value",
            endPoint: "",
            method: "GET",
          );

      results = responseData.data;
    } catch (e) {
      print(e);
      isError = true;
      setState(() {});
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.west),
        ),
        title: Text(
          "Enter your location",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              hintText: "Enter address",
              leading: Icon(Icons.search, color: Color(0xffABAAB1)),
              onChanged: (value) {
                searchText = value;
                setState(() {});

                fetchAddressOperation?.cancel();
                fetchAddressOperation = CancelableOperation.fromFuture(
                  onSearch(value),
                );
              },
            ),
            Gap(28),
            searchText.isEmpty
                ? const SizedBox()
                : isLoading
                ? Center(child: CupertinoActivityIndicator(radius: 16))
                : isError
                ? Text("Une erreur est survenue")
                : results.isEmpty
                ? Text("Aucun résultat pour votre recherche")
                : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SEARCH RESULTS"),
                      Gap(16),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder:
                              (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (builder) => BottomNavigationView(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.location_fill),
                                          Gap(8),
                                          Text(
                                            results[index]["name"],
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(4),
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          results[index]["display_name"],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, _) => Gap(20),
                          itemCount: results.length,
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
