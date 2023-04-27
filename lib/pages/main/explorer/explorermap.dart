import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/pages/main/explorer/selectroute.dart';

import '../../../constants.dart';

class ExplorerMapPage extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIconIndex;

  int endDestinationChoice;

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
    required this.selectedIconIndex,
    required this.endDestinationChoice,
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

  static const LatLng sourceLocation = LatLng(1.3800, 103.8489);
  static const LatLng destination = LatLng(1.3691149, 103.8454342);

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
            debugPrint('${widget.latStart}');
            debugPrint('${widget.longStart}');
            debugPrint('${widget.latEnd}');
            debugPrint('${widget.longEnd}');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SelectRoutePage(
                    firstLocation: widget.firstLocation,
                    secondLocation: widget.secondLocation,
                    startTime: widget.startTime,
                    endTime: widget.endTime,
                    selectedIconIndex: widget.selectedIconIndex,
                    endDestinationChoice: widget.endDestinationChoice,
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
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            "Route",
            style: TextStyle(color: Colors.black, fontSize: 20),
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
            color: Colors.black,
            width: 6,
          )
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
