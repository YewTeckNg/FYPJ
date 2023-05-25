// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'explorer.dart';

// class RatingExplorerPage extends StatefulWidget {
//   String Email;

//   String firstLocation;

//   String secondLocation;

//   TimeOfDay startTime;

//   TimeOfDay endTime;

//   int selectedIconIndex;

//   int endDestinationChoice;

//   int topK;

//   int topN;

//   double latStart;

//   double longStart;

//   double latEnd;

//   double longEnd;

//   RatingExplorerPage({
//     Key? key,
//     required this.Email,
//     required this.firstLocation,
//     required this.secondLocation,
//     required this.startTime,
//     required this.endTime,
//     required this.selectedIconIndex,
//     required this.endDestinationChoice,
//     required this.topK,
//     required this.topN,
//     required this.latStart,
//     required this.latEnd,
//     required this.longStart,
//     required this.longEnd,
//   }) : super(key: key);

//   @override
//   State<RatingExplorerPage> createState() => _RatingExplorerPageState();
// }

// class _RatingExplorerPageState extends State<RatingExplorerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 280,
//           width: 260,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.4),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: const Offset(0, 1),
//               ),
//             ],
//             borderRadius: const BorderRadius.all(
//               Radius.circular(15),
//             ),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 170.0, top: 10),
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) {
//                           return ExplorerPage(
//                             Email: widget.Email,
//                             firstLocation: widget.firstLocation,
//                             secondLocation: widget.secondLocation,
//                             startTime: widget.startTime,
//                             endTime: widget.endTime,
//                             selectedIconIndex: widget.selectedIconIndex,
//                             endDestinationChoice: widget.endDestinationChoice,
//                             topK: 2,
//                             topN: 2,
//                             latStart: widget.latStart,
//                             latEnd: widget.latEnd,
//                             longStart: widget.longStart,
//                             longEnd: widget.longEnd,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.close,
//                     size: 35,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(),
//                 child: Text(
//                   'How would you rate your',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(right: 142),
//                 child: Text(
//                   'journey?',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   SchedulerBinding.instance.addPostFrameCallback((_) {
//                     Flushbar(
//                       icon: const Icon(
//                         Icons.message,
//                         size: 32,
//                         color: Colors.white,
//                       ),
//                       shouldIconPulse: false,
//                       padding: const EdgeInsets.all(24),
//                       title: 'Success Message',
//                       message: 'Rating has been submitted. Thank you!!',
//                       flushbarPosition: FlushbarPosition.TOP,
//                       margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       duration: const Duration(seconds: 3),
//                       barBlur: 20,
//                       backgroundColor: Colors.green.shade700.withOpacity(0.9),
//                     ).show(context);
//                   });
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return ExplorerPage(
//                           Email: widget.Email,
//                           firstLocation: widget.firstLocation,
//                           secondLocation: widget.secondLocation,
//                           startTime: widget.startTime,
//                           endTime: widget.endTime,
//                           selectedIconIndex: widget.selectedIconIndex,
//                           endDestinationChoice: widget.endDestinationChoice,
//                           topK: 2,
//                           topN: 2,
//                           latStart: widget.latStart,
//                           latEnd: widget.latEnd,
//                           longStart: widget.longStart,
//                           longEnd: widget.longEnd,
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red.shade600,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(230, 50),
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ))),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
