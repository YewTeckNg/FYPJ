import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/pages/main/explorer/explorer.dart';

import '../../../constants.dart';

class ExplorerMapPage extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIndex;

  double latStart;

  double longStart;

  double latEnd;

  double longEnd;

  ExplorerMapPage({
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
  State<ExplorerMapPage> createState() => ExplorerMapPageState();
}

class ExplorerMapPageState extends State<ExplorerMapPage> {
  final TimeOfDay _timeOfDay1 = TimeOfDay.now();

  final Completer<GoogleMapController> _controller = Completer();

//  late double latStart = widget.latStart;

  static const LatLng sourceLocation = LatLng(1.37995, 103.8489487);
  static const LatLng destination = LatLng(1.3774334, 103.848787);

  // late LatLng sourceLocation = LatLng(widget.latStart, widget.longStart);
  // late LatLng destination = LatLng(widget.latEnd, widget.longEnd);

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
            // position: LatLng(widget.latStart, widget.longStart),
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
            // position: LatLng(widget.latEnd, widget.longEnd),
          ),
        },
      ),
    );
  }
}
