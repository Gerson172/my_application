// import 'package:flutter/material.dart';

// class BottomSheet extends StatefulWidget {
//   final String textMessage;
//   final IconData? icon;
//   final String bottomText;
//   final void Function() onTap;

//   BottomSheet({
//     required this.textMessage,
//     required this.icon,
//     required this.bottomText,
//     required this.onTap,
//   });

//   @override
//   State<StatefulWidget> createState() {
//     return Future<> showModalBottomSheet<void>(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: Container(
//             height: 250,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ListTile(
//                   leading: Icon(
//                     icon,
//                     color: Colors.purple,
//                     size: 40,
//                     textDirection: TextDirection.ltr,
//                   ),
//                   title: Text(
//                     bottomText,
//                     style: TextStyle(fontSize: 20),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 SizedBox(
//                   height: 50,
//                   width: 170,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Ok'),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.all(16.0),
//                       primary: Colors.purple,
//                       textStyle: TextStyle(fontSize: 24),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18.0),
//       ),
//     );
//   }
// }
