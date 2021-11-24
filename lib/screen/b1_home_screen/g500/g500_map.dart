import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class G500Map extends StatefulWidget {
  @override
  State createState() => _G500Map();
}

class _G500Map extends State<G500Map> {
  Completer<GoogleMapController> _controller = Completer();

  // LatLng initalLng = LatLng(19.28114702894692, -99.6550758167456);
  //
  // static final CameraPosition _initialCameraPosition = CameraPosition(
  //     target: LatLng(19.28114702894692, -99.6550758167456),
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("G500"),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
//             LocationResult result = await showLocationPicker(
//               context, 'AIzaSyD5xzgc4V5O2aEpUbQzB4cN3_Y2hFImBoU',
//               initialCenter: initalLng,
// //                      automaticallyAnimateToCurrentLocation: true,
// //                      mapStylePath: 'assets/mapStyle.json',
//               myLocationButtonEnabled: true,
//               // requiredGPS: true,
//               layersButtonEnabled: true,
//               // countries: ['AE', 'NG']
//
// //                      resultCardAlignment: Alignment.bottomCenter,
//               desiredAccuracy: LocationAccuracy.best,
//             );
//
//             final GoogleMapController controller = await _controller.future;
//
//             setState(() => {
//               controller.animateCamera(CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                       bearing: 192.8334901395799,
//                       target: result.latLng,
//                       tilt: 59.440717697143555,
//                       zoom: 19.151926040649414)))
//             });
          },
          label: Text('Cambiar ubicación'),
          icon: Icon(Icons.location_on),
        ),);
  }
}
