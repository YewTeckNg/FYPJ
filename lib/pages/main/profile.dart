import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/LandingPage.dart';
import 'package:project/pages/main/explorer/currentlocation.dart';
import 'package:project/pages/main/explorer/explorer.dart';
import 'package:project/pages/main/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              height: 150,
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
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 142, top: 45),
                        child: Text(
                          'Root',
                          style: TextStyle(
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'redpinsbuffer@gmail.com',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Log Out                                   ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const LandingPage();
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const LandingPage();
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                // const SizedBox(height: 37),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.question_answer_outlined,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Help & Feedback',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 87.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.people_alt_outlined,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Invite a friend',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 108.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.bookmark_border_rounded,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Saved',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 159.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Settings                                  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const SettingsPage();
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const SettingsPage();
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 306,
          ),

          // bottom navigation bar!!!!
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ExplorerPage(
                                firstLocation: 'Search destination',
                                secondLocation: 'Search destination',
                                startTime: startTime,
                                endTime: endTime,
                                selectedIconIndex: -1,
                                endDestinationChoice: 0,
                                latStart: 0,
                                latEnd: 0,
                                longStart: 0,
                                longEnd: 0,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.home_filled,
                        color: Colors.black,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const CurrentLocationPage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 30,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(
                  //           builder: (BuildContext context) {
                  //             return const PlannerPage();
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.calendar_month,
                  //       color: Colors.black,
                  //       size: 30,
                  //     )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.red.shade600,
                        size: 30,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(
                  //           builder: (BuildContext context) {
                  //             return const PointsPage();
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.wallet_giftcard_rounded,
                  //       color: Colors.black,
                  //       size: 30,
                  //     )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
