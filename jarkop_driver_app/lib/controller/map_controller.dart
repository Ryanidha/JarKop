import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  LocationData? currentLocation;
  Location location = Location();

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }


  Future<void> _getCurrentLocation() async {
    LocationData locationData;
    var locationService = await location.serviceEnabled();
    if (locationService) {
      var permission = await location.hasPermission();
      if (permission == PermissionStatus.granted) {
        locationData = await location.getLocation();
        currentLocation = locationData;
        update();
      } else {
        permission = await location.requestPermission();
        if (permission == PermissionStatus.granted) {
          locationData = await location.getLocation();
          currentLocation = locationData;
          update();
        }
      }
    } else {
      locationService = await location.requestService();
      if (locationService) {
        var permission = await location.hasPermission();
        if (permission == PermissionStatus.granted) {
          locationData = await location.getLocation();
          currentLocation = locationData;
          update();
        }
      }
    }
  }
}
