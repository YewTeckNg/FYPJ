import 'package:flutter/material.dart';
import 'package:project/pages/account/points.dart';
import 'package:project/pages/main/explorer/explorer.dart';
import 'package:project/pages/main/planner/planner.dart';
import 'package:project/pages/main/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        // hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();

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
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Welcome back Root!',
            style: TextStyle(
              color: Colors.red.shade600,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'What do you want to do today?',
            style: TextStyle(
              color: Colors.red.shade600,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        firstLocation: 'Search destination',
                        secondLocation: 'Search destination',
                        startTime: startTime,
                        endTime: endTime,
                        selectedIndex: -1,
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 260,
                width: 290,
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, bottom: 10, top: 30),
                      child: Image.asset('assets/explorer.jpg'),
                    ),
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 296,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (BuildContext context) {
          //             return const PlannerPage();
          //           },
          //         ),
          //       );
          //     },
          //     child: Container(
          //       height: 260,
          //       width: 290,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 1,
          //             blurRadius: 7,
          //             offset: const Offset(0, 3),
          //           ),
          //         ],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(20),
          //         ),
          //       ),
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(
          //                 left: 8, right: 8, bottom: 10, top: 30),
          //             child: Image.asset('assets/planner.jpg'),
          //           ),
          //           const Text(
          //             "Plan",
          //             style: TextStyle(
          //               fontSize: 25,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 15),
          // bottom nav bar!!
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Container(
              width: 360,
              height: 60,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return const HomePage();
                        //     },
                        //   ),
                        // );
                      },
                      icon:  Icon(
                        Icons.home_filled,
                        color: Colors.red.shade600,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ExplorerPage(
                                firstLocation: 'Search destination',
                                secondLocation: 'Search destination',
                                startTime: startTime,
                                endTime: endTime,
                                selectedIndex: -1,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const PlannerPage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                        size: 30,
                      )),
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
                        Icons.person_outline_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const PointsPage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.wallet_giftcard_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
