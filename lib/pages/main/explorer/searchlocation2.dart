import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:project/pages/main/explorer/choiceForEnd.dart';
import 'package:project/pages/main/explorer/explorer.dart';

import '../../../components/location_list_tile.dart';
import '../../../components/network_util.dart';
import '../../../constants.dart';
import '../../../models/autocomplate_prediction.dart';
import '../../../models/place_auto_complate_response.dart';

class SearchLocationPage2 extends StatefulWidget {
  String Email;

  String UID;

  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIconIndex;

  int endDestinationChoice;

  int topK;

  int topN;

  double latStart;

  double longStart;

  double latEnd;

  double longEnd;

  SearchLocationPage2({
    Key? key,
    required this.Email,
    required this.UID,
    required this.firstLocation,
    required this.secondLocation,
    required this.startTime,
    required this.endTime,
    required this.selectedIconIndex,
    required this.endDestinationChoice,
    required this.topK,
    required this.topN,
    required this.latStart,
    required this.latEnd,
    required this.longStart,
    required this.longEnd,
  }) : super(key: key);

  @override
  State<SearchLocationPage2> createState() => _SearchLocationPage2State();
}

class _SearchLocationPage2State extends State<SearchLocationPage2> {
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
            padding: const EdgeInsets.only(top: 50, bottom: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ChoiceForEndPage(
                              Email: widget.Email,
                              UID: widget.UID,
                              firstLocation: widget.firstLocation,
                              secondLocation: widget.secondLocation,
                              startTime: widget.startTime,
                              endTime: widget.endTime,
                              selectedIconIndex: widget.selectedIconIndex,
                              endDestinationChoice: widget.endDestinationChoice,
                              topK: widget.topK,
                              topN: widget.topN,
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
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    "Your end destination",
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
                      hintText: "Search your end destination",
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        Email: widget.Email,
                        UID: widget.UID,
                        firstLocation: widget.firstLocation,
                        secondLocation: 'Nanyang Polytechnic',
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIconIndex: widget.selectedIconIndex,
                        endDestinationChoice: widget.endDestinationChoice,
                        topK: widget.topK,
                        topN: widget.topN,
                        // start coords
                        latStart: widget.latStart,
                        longStart: widget.longStart,
                        // end coords
                        latEnd: 1.3800,
                        longEnd: 103.8489,
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

                  PlacesDetailsResponse detail =
                      await _places.getDetailsByPlaceId(placeId);

                  double? lat2 = detail.result.geometry?.location.lat;
                  double? lng2 = detail.result.geometry?.location.lng;

                  print('$lat2');
                  print('$lng2');

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ExplorerPage(
                          Email: widget.Email,
                          UID: widget.UID,
                          firstLocation: widget.firstLocation,
                          secondLocation: placePredictions[index].description!,
                          startTime: widget.startTime,
                          endTime: widget.endTime,
                          selectedIconIndex: widget.selectedIconIndex,
                          endDestinationChoice: widget.endDestinationChoice,
                          topK: widget.topK,
                          topN: widget.topN,
                          // start coords
                          latStart: widget.latStart,
                          longStart: widget.longStart,
                          // end coords
                          latEnd: lat2!,
                          longEnd: lng2!,
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
