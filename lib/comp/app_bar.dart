// import 'package:flutter/material.dart';
//
// class DAppBar extends StatelessWidget {
//   static final double appBarHeight = 160;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       leading: IconButton(
//         onPressed: (){},
//         icon: Icon(Icons.close),
//         iconSize: 32,
//       ),
//       expandedHeight: appBarHeight,
//       forceElevated: true,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: false,
//         title: Wrap(
//           children: <Widget>[
//             Text(
//               "div.is", // insert relative page name
//               overflow: TextOverflow.ellipsis,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 80,
//                   alignment: Alignment.bottomLeft,
//                     child: MaterialButton(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 6),
//                   child: Text("Hello",
//                     style: TextStyle(
//                         fontSize: Theme.of(context).textTheme.caption.fontSize),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 2),
//               child: Text(
//                 "Restaurant si",
//                 style: TextStyle(
//                     fontSize: Theme.of(context).textTheme.caption.fontSize),
//               ),
//             ),
//           ],
//         ),
//         background: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     const Color(0x00000000),
//                     const Color(0xAA000000),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }