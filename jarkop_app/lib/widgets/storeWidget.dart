// import 'package:flutter/material.dart';

// class CustomListItem extends StatelessWidget {
//   const CustomListItem(
//       {super.key,
//       required this.image,
//       required this.menu,
//       required this.harga,
//       required this.descMenu});
//   final Widget image;
//   final String menu;
//   final String harga;
//   final String descMenu;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 3,
//             child: _menuDescription(
//               menu: menu,
//               harga: harga,
//               descMenu: descMenu,
//             ),
//           ),
//           Text(
//             harga,
//             style: TextStyle(
//                 fontFamily: 'Noto Sans',
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _menuDescription extends StatelessWidget {
//   const _menuDescription(
//       {required this.menu, required this.harga, required this.descMenu});

//   final String menu;
//   final String harga;
//   final String descMenu;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               menu,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//               ),
//             ),
//             const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//             Text(
//               harga,
//               style: const TextStyle(fontSize: 15.0),
//             ),
//             const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//             Text(
//               descMenu,
//               style: const TextStyle(fontSize: 15.0),
//             ),
//             Container(
//                 height: 28,
//                 decoration: BoxDecoration(
//                     color: Color(0xffFFD18D),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Row(
//                   children: [
//                     TextButton(
//                       onPressed: (() {}),
//                       child: Text(
//                         "Detail",
//                         style: TextStyle(
//                             fontFamily: 'Noto Sans',
//                             fontSize: 12,
//                             color: Colors.black),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: (() {}),
//                       child: Text(
//                         "Detail",
//                         style: TextStyle(
//                             fontFamily: 'Noto Sans',
//                             fontSize: 12,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class orderHistory extends StatelessWidget {
//   const orderHistory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       itemExtent: 106.0,
//       children: <CustomListItem>[
//         CustomListItem(
//           menu: 'Customer 1 - Completed',
//           harga: '23 Feb 2023 10:10',
//           descMenu: '50.000',
//           image: ,
//         ),
//         CustomListItem(
//           menu: 'Customer 2 - Canceled',
//           harga: '23 Feb 2023 10:10',
//           descMenu: '75.000',
//           image: ,
//         ),
//       ],
//     );
//   }
// }
