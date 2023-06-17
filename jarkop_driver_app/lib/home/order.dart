
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jarkop_driver_app/controller/map_controller.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: unused_field
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  final MapController mapController = Get.put(MapController());
  // final Marker origin;
  // Marker _destination;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 90,
                width: sw,
                decoration: const BoxDecoration(color: Color(0xffEACDA2)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.store,
                            size: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Pick up",
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Drop Off",
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ],
                      )
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 500,
            width: sw,
            child: GetBuilder<MapController>(
              builder: (controller) {
                if (controller.currentLocation == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: OrderPage._kGooglePlex.target,
                      zoom: 15,
                    ),
                    onMapCreated: (controller) {
                      mapController.mapController = controller;
                    },
                    // markers: {
                    //   if (_origin != null) _origin,
                    // },
                    // onLongPress:_addMarker,
                    myLocationEnabled: true,
                  );
                }
              },
            ),
          ),
          Container(
            height: 150,
            width: sw,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 12.0, left: 20.0, right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Pelanggan",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Jl. Dekat Selokan No.520",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              Text(
                                "RW 9 RT 6",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                     IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
                        const SizedBox(width: 10),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Toko",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Jl. Dekat Selokan No.520",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              Text(
                                "RW 9 RT 6",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
                        const SizedBox(width: 10),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 10, bottom: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("1x Cappucino",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black)),
                            Spacer(),
                            Text("Rp 14.000,00",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("1x Pisang Goreng",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black)),
                            Spacer(),
                            Text("Rp 9.000,00",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Total Payment",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black)),
                            Spacer(),
                            Text("Rp 23.000,00",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: Colors.black))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    height: 50,
                    width: 258,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFD18D),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "PICK-UP",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          //
        ],
      ),
    );
  }

  // void _addMarker(LatLng pos) {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon:
  //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos,
  //         );
  //         // _destination = null;
  //     });
  //   } else {
  //     setState(() {
  //       _origin =Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon:
  //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //         );
  //     });
  //   }
  // }
}
