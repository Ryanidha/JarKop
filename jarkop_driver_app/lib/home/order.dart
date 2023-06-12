// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class OrderPage extends StatelessWidget {
//   const OrderPage({super.key});
//    static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     final sw = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
        
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(),
//                 height: 90,
//                 width: sw,
//                 decoration: BoxDecoration(
//                   color: Color(0xffEACDA2)
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                   Container(
//                       child: Row(
//                         children: [
//                           Icon(Icons.store,size: 20,),
//                   TextButton(
//                     onPressed: (){}, 
//                     child: Text(
//                       "Pick up",
//                       style: TextStyle(
//                         fontFamily: 'Noto Sans',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black
//                       ),
//                     )
//                     ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Icon(Icons.location_on,size: 20,),
//                   TextButton(
//                     onPressed: (){}, 
//                     child: Text(
//                       "Drop Off",
//                       style: TextStyle(
//                         fontFamily: 'Noto Sans',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black
//                       ),
//                     )
//                     ),
//                         ],
//                       ),
//                     )
                    
//                   ]),
//               )
//             ],
//            ),
//         ],
//       ),
//     );
//   }
// }
