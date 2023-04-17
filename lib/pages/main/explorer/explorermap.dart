
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/pages/main/explorer/explorer.dart';

import '../../../constants.dart';


class ExplorerMapPage extends StatefulWidget {
    String firstLocation;

  String secondLocation;

  ExplorerMapPage(
      {Key? key, required this.firstLocation, required this.secondLocation})
      : super(key: key);

  @override
  State<ExplorerMapPage> createState() => ExplorerMapPageState();
}

class ExplorerMapPageState extends State<ExplorerMapPage> {
final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(1.380089433404809, 103.8489916124544);
  static const LatLng destination = LatLng(1.380089433404809, 103.8489916124544);

  List<LatLng> polyLineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Text(
            "Track order",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sourceLocation,
          zoom: 14.5,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polyLineCoordinates,
          ),
        },
        markers: {
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
      ),
    );
  }
}
