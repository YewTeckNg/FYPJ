import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorermap.dart';

import '../../../constants.dart';
import 'explorer.dart';

class SelectRoutePage extends StatefulWidget {
  String Email;

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

  SelectRoutePage({
    Key? key,
    required this.Email,
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
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: IconButton(
                      onPressed: () {
                        // print('numbner of topk: ${widget.topK}');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ExplorerPage(
                                Email: widget.Email,
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
                    padding: EdgeInsets.only(left: 65),
                    child: Text(
                      "Select Your Route",
                      style: TextStyle(
                        color: textColorLightTheme,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                height: 170,
                width: 320,
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Icon(
                              Icons.location_on,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 50,
                            width: 3,
                            color: Colors.grey.shade400,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 197, top: 25),
                          child: Text(
                            'From',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 15),
                              child: SizedBox(
                                height: 40,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9.0),
                                  child: Text(
                                    widget.firstLocation,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 3,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text(
                                widget.startTime.format(context).toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 3),
                          child: Container(
                            height: 3,
                            width: 240,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 213, top: 10),
                              child: Text(
                                'To',
                                style: TextStyle(
                                  color: Colors.red.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        widget.secondLocation,
                                        style: TextStyle(
                                          color: Colors.red.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 3,
                                  color: Colors.grey.shade300,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Text(
                                    widget.endTime.format(context).toString(),
                                    style: TextStyle(
                                      color: Colors.red.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            // routes
            Container(
              height: 780,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(27),
                  topRight: Radius.circular(27),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Here are the best generated',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'routes just for you:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 700,
                    // color: Colors.black,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < widget.topN; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            // route 1
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ExplorerMapPage(
                                        Email: widget.Email,
                                        firstLocation: widget.firstLocation,
                                        secondLocation: widget.secondLocation,
                                        startTime: widget.startTime,
                                        endTime: widget.endTime,
                                        selectedIconIndex:
                                            widget.selectedIconIndex,
                                        endDestinationChoice:
                                            widget.endDestinationChoice,
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
                              child: Container(
                                height: 120,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(27),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Row(
                                        children:  [
                                          Text(
                                            'Route ${i+1} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                          // Text(
                                          //   '(RECOMMENDED)',
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.w500,
                                          //     color: Colors.grey.shade600,
                                          //     fontSize: 15,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.directions_walk,
                                            color: Colors.grey.shade600,
                                          ),
                                          Text(
                                            '50 min ',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Walk straight to ___ (??m) ',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.black,
                                            size: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(),
                                            child: Text(
                                              ' Turn ...',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
