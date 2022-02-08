// ignore_for_file: prefer_final_fields, prefer_const_constructors, unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locationapp/screens/bottombar_page.dart';

class GoogleMapSample extends StatefulWidget {
  const GoogleMapSample({Key? key}) : super(key: key);

  @override
  State<GoogleMapSample> createState() => GoogleMapSampleState();
}

class GoogleMapSampleState extends State<GoogleMapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.437935, 70.601010),
    zoom: 1,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(22.437935, 70.601010),
      tilt: 90,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Center(
          child: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomBarPage()),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 40,
                left: 5,
                right: 5,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextField(
                          onChanged: (value) {
                            // filterSearchResults(
                            //   value.toLowerCase(),
                            // );
                          },
                          // controller: editingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Current Loaction",
                            prefixIcon: IconButton(
                              color: Colors.blue,
                              onPressed: null,
                              // editingController.clear,
                              icon: Icon(Icons.car_repair),
                            ),
                            suffixIcon: IconButton(
                              onPressed: null,
                              // editingController.clear,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Confirm Pick up',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 180,
                right: 5,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: _goToTheLake,
                    // editingController.clear,
                    icon: Icon(Icons.my_location),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
