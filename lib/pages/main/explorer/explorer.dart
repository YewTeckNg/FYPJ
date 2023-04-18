import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorermap.dart';
import 'package:project/pages/main/explorer/searchlocation2.dart';
import 'package:project/pages/main/explorer/searchlocation1.dart';
import 'package:project/pages/main/profile.dart';

class ExplorerPage extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  ExplorerPage(
      {Key? key, required this.firstLocation, required this.secondLocation})
      : super(key: key);

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  int pageIndex = 0;

  int selectedIndex = -1;

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
      });
    });
  }

  int nowSec = 0;
  int endSec = 0;
  int previousSec = 0;
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
              padding: const EdgeInsets.only(top: 70.0, left: 15, right: 30),
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
                          padding: const EdgeInsets.only(right: 42),
                          child: SizedBox(
                            height: 60,
                            width: 205,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 22, left: 24),
                              child: Text(
                                widget.firstLocation,
                                // ' 9 Raffles Place #25-00',

                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
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
                            return SearchLocationPage2(
                              firstLocation: widget.firstLocation,
                              secondLocation: widget.secondLocation,
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
                          padding: const EdgeInsets.only(right: 42),
                          child: SizedBox(
                            height: 60,
                            width: 205,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 22, left: 24),
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
                            _timeOfDay1.format(context).toString(),
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
                            _timeOfDay2.format(context).toString(),
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
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedIndex == index
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
                                      child: selectedIndex == index
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
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedIndex == index2
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: selectedIndex == index2
                                          ? const Icon(
                                              Icons.directions_car,
                                              size: 25,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.directions_car,
                                              size: 25,
                                              color: Colors.black,
                                            )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index3;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedIndex == index3
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: selectedIndex == index3
                                          ? const Icon(
                                              Icons.directions_walk,
                                              size: 25,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.directions_walk,
                                              size: 25,
                                              color: Colors.black,
                                            )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index4;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 5, right: 5),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedIndex == index4
                                    ? Colors.red
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: selectedIndex == index4
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
                    nowSec = (_timeOfDay1.hour * 60 + _timeOfDay1.minute) * 60;
                    endSec = (_timeOfDay2.hour * 60 + _timeOfDay2.minute) * 60;
                    previousSec = (_timeOfDay3.hour * 60 + _timeOfDay3.minute *60) * 60;
                    if (widget.firstLocation != 'Search destination' &&
                        widget.secondLocation != 'Search destination' &&
                        endSec > nowSec &&
                        nowSec >= previousSec &&
                        (selectedIndex == index ||
                            selectedIndex == index2 ||
                            selectedIndex == index3 ||
                            selectedIndex == index4)) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ExplorerMapPage(
                              firstLocation: widget.firstLocation,
                              secondLocation: widget.secondLocation,
                            );
                          },
                        ),
                      );
                    } else {
                      debugPrint(widget.firstLocation);
                      if (widget.firstLocation == 'Search destination') {
                        showTopSnackBar1(context);
                      } else if (widget.secondLocation ==
                          'Search destination') {
                        showTopSnackBar2(context);
                      } else if (!(endSec > nowSec)) {
                        showTopSnackBar3(context);
                      } else if(!(nowSec >= previousSec)){
                        showTopSnackBar4(context);
                      }
                      else if (!(selectedIndex == index ||
                          selectedIndex == index2 ||
                          selectedIndex == index3 ||
                          selectedIndex == index4)) {
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
                  'Create trip',
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
