import 'package:flutter/material.dart';

import 'explorer.dart';

class SelectRoutePage extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIndex;

  double latStart;

  double longStart;

  double latEnd;

  double longEnd;

  SelectRoutePage({
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
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 37, bottom: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 58),
                  child: IconButton(
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
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 4,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 4,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 4,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.red.shade600,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          widget.firstLocation,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          widget.secondLocation,
                          style: const TextStyle(
                            fontSize: 16,
                            // color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.grey.shade200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 200),
            child: RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Departs at ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: widget.startTime.format(context).toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ]),
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.grey.shade200,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              // color: Colors.grey,
              width: 500,
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 275),
                    child: Text(
                      'ROUTE 1',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.startTime.format(context).toString(),
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
