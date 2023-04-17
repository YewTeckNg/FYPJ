import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorer.dart';


import '../../../components/location_list_tile.dart';
import '../../../components/network_util.dart';
import '../../../constants.dart';
import '../../../models/autocomplate_prediction.dart';
import '../../../models/place_auto_complate_response.dart';

class SearchLocationPage2 extends StatefulWidget {
    String firstLocation;

  String secondLocation;

  SearchLocationPage2(
      {Key? key, required this.firstLocation, required this.secondLocation})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1000,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(27),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 70, top: 70, right: 20, left: 20),
                child: Container(
                  height: 60,
                  width: 370,
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
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          placeAutocomplete(value);
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search your location",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ExplorerPage(
                                        firstLocation: widget.firstLocation,
                                        secondLocation: widget.secondLocation,
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_back_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 560,
              width: 1000,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(27),
                  topRight: Radius.circular(27),
                ),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) => LocationListTile(
                    press: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ExplorerPage(
                              firstLocation: widget.firstLocation,
                              secondLocation: placePredictions[index].description!,
                            );
                          },
                        ),
                      );
                    },
                    location: placePredictions[index].description!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
