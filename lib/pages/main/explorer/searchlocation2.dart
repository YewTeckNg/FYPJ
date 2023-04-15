import 'package:flutter/material.dart';
import 'explorer.dart';

class SearchLocationPage2 extends StatefulWidget {
  const SearchLocationPage2({super.key});

  @override
  State<SearchLocationPage2> createState() => _SearchLocationPage2State();
}

class _SearchLocationPage2State extends State<SearchLocationPage2> {
  @override
  String _location = 'Search destination';

  Container location = Container();

  Container locationEmpty = Container();

  Container locationplaceholder = Container(
    height: 100,
    width: 370,
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
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 35),
          child: Text(
            'Plaza Singapura',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(left: 50),
        //   child: Text(
        //     '7 pm',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 200,
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
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _location = 'Plaza Singapura';
                        location = locationplaceholder;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(370, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.grey.shade800,
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ExplorerPage(
                                      firstLocation: 'Search Destination',
                                      secondLocation: 'Search Destination',
                                    );
                                  },
                                ),
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(right: 99),
                          child: SizedBox(
                            height: 50,
                            width: 145,
                            child: Center(
                              child: Text(
                                _location,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
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
                                _location = 'Search destination';
                                location = locationEmpty;
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 560,
            width: 1000,
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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                //location
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ExplorerPage(
                            firstLocation: '9 Raffles Place #25-00',
                            secondLocation: 'Plaza Singapura',
                          );
                        },
                      ),
                    );
                  },
                  child: location,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
