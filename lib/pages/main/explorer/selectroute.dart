import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import 'explorer.dart';

class SelectRoutePage extends StatefulWidget {
  String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIndex;

  SelectRoutePage({
    Key? key,
    required this.firstLocation,
    required this.secondLocation,
    required this.startTime,
    required this.endTime,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarTextStyle: const TextStyle(color: textColorLightTheme),
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: defaultPadding),
        //   // child: CircleAvatar(
        //   //   backgroundColor: secondaryColor10LightTheme,
        //   //   child: SvgPicture.asset(
        //   //     "assets/icons/location.svg",
        //   //     height: 16,
        //   //     width: 16,
        //   //     color: secondaryColor40LightTheme,
        //   //   ),
        //   // ),
        // ),
        title: Row(
          children: [
            IconButton(
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
            const Padding(
              padding: EdgeInsets.only(left: 7.0),
              child: Text(
                "Your starting location",
                style: TextStyle(color: textColorLightTheme),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
