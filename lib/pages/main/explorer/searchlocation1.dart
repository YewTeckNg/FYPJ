import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/pages/main/explorer/explorer.dart';

import '../../../components/location_list_tile.dart';
import '../../../components/network_util.dart';
import '../../../constants.dart';
import '../../../models/autocomplate_prediction.dart';
import '../../../models/place_auto_complate_response.dart';
import 'package:google_maps_webservice/places.dart';

class SearchLocationPage1 extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIndex;

  double latStart;

  double longStart;

  double latEnd;

  double longEnd;

  SearchLocationPage1({
    Key? key,
    required this.firstLocation,
    required this.secondLocation,
    required this.startTime,
    required this.endTime,
    required this.selectedIndex,
    required this.latStart,
    required this.latEnd,
    required this.longStart,
    required this.longEnd,
  }) : super(key: key);

  @override
  State<SearchLocationPage1> createState() => _SearchLocationPage1State();
}

class _SearchLocationPage1State extends State<SearchLocationPage1> {
  List<AutocompletePrediction> placePredictions = [];
  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json', // unencoder path
        {
          "input": query, // query parameter
          "key": search_apiKey,
        });
    // make the GET request

    String? response = await NetworkUtil.fetchUrl(uri);

    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);

      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: search_apiKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ExplorerPage(
                              firstLocation: widget.firstLocation,
                              secondLocation: widget.secondLocation,
                              startTime: widget.startTime,
                              endTime: widget.endTime,
                              selectedIndex: widget.selectedIndex,
                              latStart: widget.latStart,
                              latEnd: widget.latEnd,
                              longStart: widget.longStart,
                              longEnd: widget.longEnd,
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 65),
                  child: Text(
                    "Your starting location",
                    style: TextStyle(
                        color: textColorLightTheme,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 30,
              bottom: 20,
            ),
            child: Container(
              height: 50,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: TextFormField(
                    onChanged: (value) {
                      placeAutocomplete(value);
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search your location",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SvgPicture.asset(
                          "assets/location_pin.svg",
                          color: secondaryColor40LightTheme,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey.shade200,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton.icon(
              onPressed: () {
                // debugPrint();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        firstLocation: 'Nanyang Polytechnic',
                        secondLocation: widget.secondLocation,
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIndex: widget.selectedIndex,
                        latStart: widget.latStart,
                        latEnd: widget.latEnd,
                        longStart: widget.longStart,
                        longEnd: widget.longEnd,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Use my Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: textColorLightTheme,
                elevation: 0,
                minimumSize: const Size(380, 45),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey.shade200,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                press: () async {
                  debugPrint(placePredictions[index].placeId!);
                  var placeId = placePredictions[index].placeId!;

                  // PlacesDetailsResponse detail = _places
                  //     .getDetailsByPlaceId(placeId) as PlacesDetailsResponse;

                  // double? lat = detail.result.geometry?.location.lat;
                  // double? lng = detail.result.geometry?.location.lng;

                  // print(lat);
                  // print(lng);

                  PlacesDetailsResponse detail =
                      await _places.getDetailsByPlaceId(placeId);

                  double? lat1 = detail.result.geometry?.location.lat;
                  double? lng1 = detail.result.geometry?.location.lng;

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ExplorerPage(
                          firstLocation: placePredictions[index].description!,
                          secondLocation: widget.secondLocation,
                          startTime: widget.startTime,
                          endTime: widget.endTime,
                          selectedIndex: widget.selectedIndex,
                          latStart: lat1!,
                          latEnd: lng1!,
                          longStart: widget.longStart,
                          longEnd: widget.longEnd,
                        );
                      },
                    ),
                  );
                },
                location: placePredictions[index].description!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
