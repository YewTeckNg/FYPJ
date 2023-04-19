import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/pages/main/explorer/explorer.dart';

import '../../../components/location_list_tile.dart';
import '../../../components/network_util.dart';
import '../../../constants.dart';
import '../../../models/autocomplate_prediction.dart';
import '../../../models/place_auto_complate_response.dart';

class SearchLocationPage1 extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIndex;

  SearchLocationPage1({
    Key? key,
    required this.firstLocation,
    required this.secondLocation,
    required this.startTime,
    required this.endTime,
    required this.selectedIndex,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarTextStyle: const TextStyle(color: textColorLightTheme),
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: defaultPadding),
        //   // child: CircleAvatar(
        //   //   backgroundColor: secondaryColor10LightTheme,
        //   //   child: SvgPicture.asset(
        //   //     "assets/icons/location.svg",
        //   //     height: 16,
        //   //     width: 16,
        //   //     color: secondaryColor40LightTheme,
        //   //   ),
        //   // ),
        // ),
        title: Row(
          children: [
            IconButton(
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
            const Padding(
              padding: EdgeInsets.only(left: 7.0),
              child: Text(
                "Your starting location",
                style: TextStyle(color: textColorLightTheme),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        firstLocation: 'Nanyang Polytechnic',
                        secondLocation: widget.secondLocation,
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIndex: widget.selectedIndex,
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
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ExplorerPage(
                          firstLocation: placePredictions[index].description!,
                          secondLocation: widget.secondLocation,
                          startTime: widget.startTime,
                          endTime: widget.endTime,
                          selectedIndex: widget.selectedIndex,
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
