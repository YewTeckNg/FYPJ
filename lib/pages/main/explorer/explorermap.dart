import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/pages/main/explorer/selectroute.dart';

import '../../../constants.dart';
import 'explorer.dart';

class ExplorerMapPage extends StatefulWidget {
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

  ExplorerMapPage({
    Key? key,
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
  State<ExplorerMapPage> createState() => ExplorerMapPageState();
}

class ExplorerMapPageState extends State<ExplorerMapPage> {
  final TimeOfDay _timeOfDay1 = TimeOfDay.now();

  final Completer<GoogleMapController> _controller = Completer();

//  late double latStart = widget.latStart;

  // static const LatLng sourceLocation = LatLng(1.3800, 103.8489);
  // static const LatLng destination = LatLng(1.3691149, 103.8454342);

  late LatLng sourceLocation = LatLng(widget.latStart, widget.longStart);
  late LatLng POI1 = LatLng(widget.latStart, widget.longStart);
  late LatLng POI2 = LatLng(widget.latStart, widget.longStart);
  late LatLng POI3 = LatLng(widget.latStart, widget.longStart);
  late LatLng destination = LatLng(widget.latEnd, widget.longEnd);

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

  // LatLng? hoverSpot;

  // void setHoverSpot(LatLng? val) {
  //   hoverSpot = val;
  //   notifyListeners();
  // }

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
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0),
          child: Row(
            children: [
              const Text(
                "Route",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 108),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          content: SizedBox(
                            height: 240,
                            width: 240,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        'Instructions',
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '1. The map shows your starting ',
                                  style: TextStyle(fontSize: 17),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 167),
                                  child: Text('point'),
                                ),
                                const Text(''),
                                const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    '2. To increase map size, click',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text('on the "+" icon at the bottom'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 68),
                                  child: Text('right of the screen.'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: MouseRegion(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: sourceLocation,
            zoom: 14.5,
          ),
          polylines: {
            Polyline(
              polylineId: const PolylineId("route"),
              points: polyLineCoordinates,
              color: Colors.black,
              width: 5,
            )
          },
          markers: {
            Marker(
              markerId: const MarkerId("source"),
              position: sourceLocation,
              // position: LatLng(widget.latStart, widget.longStart),
            ),
            Marker(
              markerId: const MarkerId("destination"),
              position: destination,
              // position: LatLng(widget.latEnd, widget.longEnd),
            ),
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                content: SizedBox(
                  height: 240,
                  width: 240,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 170.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 35,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'How would you rate your',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'journey?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            Flushbar(
                              icon: const Icon(
                                Icons.message,
                                size: 32,
                                color: Colors.white,
                              ),
                              shouldIconPulse: false,
                              padding: const EdgeInsets.all(24),
                              title: 'Success Message',
                              message: 'Rating has been submitted. Thank you!!',
                              flushbarPosition: FlushbarPosition.TOP,
                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              duration: const Duration(seconds: 3),
                              barBlur: 20,
                              backgroundColor:
                                  Colors.green.shade700.withOpacity(0.9),
                            ).show(context);
                          });
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ExplorerPage(
                                  firstLocation: 'Search destination',
                                  secondLocation: 'Search destination',
                                  startTime: TimeOfDay.now(),
                                  endTime: TimeOfDay.now(),
                                  selectedIconIndex: -1,
                                  endDestinationChoice: 0,
                                  topK: 0,
                                  topN: 0,
                                  latStart: 0,
                                  latEnd: 0,
                                  longStart: 0,
                                  longEnd: 0,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(230, 50),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: const Text('End Journey'),
        icon: const Icon(Icons.map),
        backgroundColor: Colors.red.shade600,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
