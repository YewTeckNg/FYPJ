import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/searchlocation1.dart';
import 'package:project/pages/main/explorer/selectroute.dart';
import 'package:project/pages/main/profile.dart';

import 'choiceForEnd.dart';

class ExplorerPage extends StatefulWidget {
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

  ExplorerPage({
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
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  int pageIndex = 0;

  // int selectedIconIndex = -1;

  int index = 1;
  int index2 = 2;
  int index3 = 3;
  int index4 = 4;

  bool click = true;
  bool click2 = true;
  bool click3 = true;
  bool click4 = true;

  TimeOfDay _timeOfDay1 = TimeOfDay.now();

  TimeOfDay _timeOfDay2 = TimeOfDay.now();

  final TimeOfDay _timeOfDay3 = TimeOfDay.now();

  void _showTimePicker1() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay1 = value!;
        widget.startTime = _timeOfDay1;
      });
    });
  }

  void _showTimePicker2() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay2 = value!;
        widget.endTime = _timeOfDay2;
      });
    });
  }

  int nowSec = 0;
  int endSec = 0;
  int previousSec = 0;
  int diffSec = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      // body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55.0, left: 15, right: 30),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ProfilePage();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 1,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Travel with the power of AI         ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            // color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(width: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ProfilePage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(50, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Starting location',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SearchLocationPage1(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(352, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade800,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            // color: Colors.amber,
                            height: 40,
                            width: 245,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 5, bottom: 10),
                              child: Text(
                                widget.firstLocation,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            // color: Colors.red,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.firstLocation = 'Search destination';
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(width: 20,),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: Text(
                    'End destination',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ChoiceForEndPage(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(352, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade800,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            height: 40,
                            width: 245,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 5, bottom: 10),
                              child: Text(
                                widget.secondLocation,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.secondLocation = 'Search destination';
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(width: 20,),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 30),
                  child: Text(
                    'Start Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120, top: 30),
                  child: Text(
                    'End Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: ElevatedButton(
                      onPressed: _showTimePicker1,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(100, 60),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            widget.startTime.format(context).toString(),
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 105),
                    child: ElevatedButton(
                      onPressed: _showTimePicker2,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(100, 60),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            widget.endTime.format(context).toString(),
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250, top: 30),
              child: Text(
                'Transport',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 25, left: 25, bottom: 10),
                  child: SizedBox(
                    height: 110,
                    width: 342,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.selectedIconIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: widget.selectedIconIndex == index
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: widget.selectedIconIndex == index
                                        ? const Icon(
                                            Icons.directions_walk,
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.directions_walk,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.selectedIconIndex = index2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: widget.selectedIconIndex == index2
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: widget.selectedIconIndex == index2
                                        ? const Icon(
                                            Icons.directions_car,
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.directions_car,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.selectedIconIndex = index3;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: widget.selectedIconIndex == 3
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: widget.selectedIconIndex == index3
                                        ? const Icon(
                                            Icons.directions_bike,
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.directions_bike,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            debugPrint('Hi new line');
                            debugPrint('Lat Start: ${widget.latStart}');
                            debugPrint('Long Start: ${widget.longStart}');

                            debugPrint('Lat End: ${widget.latEnd}');
                            debugPrint('Long End: ${widget.longEnd}');
                            setState(() {
                              widget.selectedIconIndex = index4;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: widget.selectedIconIndex == index4
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      // child: Icon(
                                      //   Icons.directions_bus_rounded,
                                      //   size: 25,
                                      //   color: Colors.black,
                                      // ),

                                      child: widget.selectedIconIndex == index4
                                          ? Image.asset(
                                              'assets/public-transport.jpg',
                                              height: 35,
                                              width: 35,
                                              color: Colors.white,
                                            )
                                          : Image.asset(
                                              'assets/public-transport.jpg',
                                              height: 35,
                                              width: 35,
                                              color: Colors.black,
                                            ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    nowSec =
                        (widget.startTime.hour * 60 + widget.startTime.minute) *
                            60;
                    endSec =
                        (widget.endTime.hour * 60 + widget.endTime.minute) * 60;
                    previousSec =
                        (_timeOfDay3.hour * 60 + _timeOfDay3.minute) * 60;
                    diffSec = endSec - nowSec;
                    debugPrint('{\n "UID" : "Root"\n "TopK" : "3"\n "TopN" : "3"\n "Time" : "$diffSec"\n "VehicleMode" : "${widget.selectedIconIndex}"\n "Mode" : "${widget.endDestinationChoice}"\n "UserEndPoi" : "${widget.secondLocation}"\n "Latitude" : "${widget.latEnd}"\n "Longitude" : "${widget.longEnd}"\n}');
                    if (widget.firstLocation != 'Search destination' &&
                        widget.secondLocation != 'Search destination' &&
                        endSec > nowSec &&
                        nowSec >= previousSec &&
                        (widget.selectedIconIndex == index ||
                            widget.selectedIconIndex == index2 ||
                            widget.selectedIconIndex == index3 ||
                            widget.selectedIconIndex == index4)) {
                      // debugPrint('Lat Start: ${widget.latStart}');
                      // debugPrint('Long Start: ${widget.longStart}');

                      // debugPrint('Lat End: ${widget.latEnd}');
                      // debugPrint('Long End: ${widget.longEnd}');

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
                    } else {
                      if (widget.firstLocation == 'Search destination') {
                        showTopSnackBar1(context);
                      } else if (widget.secondLocation ==
                          'Search destination') {
                        showTopSnackBar2(context);
                      } else if (!(endSec > nowSec)) {
                        showTopSnackBar3(context);
                      } else if (nowSec < previousSec) {
                        showTopSnackBar4(context);
                      } else if (!(widget.selectedIconIndex == index ||
                          widget.selectedIconIndex == index2 ||
                          widget.selectedIconIndex == index3 ||
                          widget.selectedIconIndex == index4)) {
                        showTopSnackBar5(context);
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(360, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  'Create Trip',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showTopSnackBar1(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Please select a starting location',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);

  void showTopSnackBar2(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Please select a end destination',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);

  void showTopSnackBar3(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'End Time must be more than start time',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);
  void showTopSnackBar4(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Start time selected cannot be before current time',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);
  void showTopSnackBar5(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Please select a mode of transport',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);

      
}

class TravelInfo {
  final String name;
  final String email;

  TravelInfo(this.name, this.email);

  TravelInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  
}