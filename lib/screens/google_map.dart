// ignore_for_file: prefer_final_fields, prefer_const_constructors, unnecessary_new

import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locationapp/screens/bottombar_page.dart';

class GoogleMapSample extends StatefulWidget {
  GoogleMapSample({Key? key, required this.googleMapPassed}) : super(key: key);
  final Widget googleMapPassed;
  @override
  State<GoogleMapSample> createState() => GoogleMapSampleState();
}

class GoogleMapSampleState extends State<GoogleMapSample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool get isForwardAnimation =>
      animationController.status == AnimationStatus.forward ||
      animationController.status == AnimationStatus.completed;
  // late AnimationController targetButtonAnimationController;
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
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 500), () => animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'herotag',
              child: widget.googleMapPassed,
            ),
            // Hero(
            //   tag: 'herotag',
            //   child: DecoratedBox(
            //     decoration: new BoxDecoration(
            //       image: new DecorationImage(
            //           image: new AssetImage('assets/images/worldimage2.png'),
            //           fit: BoxFit.fill),
            //     ),
            //   ),
            // ),
            Positioned(
              top: 30,
              left: 20,
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
              bottom: MediaQuery.of(context).size.width / 4,
              right: 5,
              left: 5,
              child: Hero(
                tag: 'icontag',
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        onChanged: (value) {
                          // filterSearchResults(
                          //   value.toLowerCase(),
                          // );
                        },
                        // controller: editingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                ),
              ),
            ),

            Positioned(
              bottom: MediaQuery.of(context).size.height / 35,
              right: 5,
              left: 5,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-0.5, 0),
                  end: Offset.zero,
                ).animate(animationController),
                child: FadeTransition(
                  opacity: animationController,
                  child: Container(
                    alignment: Alignment.centerLeft,
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
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 2.3,
              right: 5,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => FadeScaleTransition(
                  animation: animationController,
                  child: Visibility(
                    visible:
                        animationController.status != AnimationStatus.dismissed,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        // editingController.clear,
                        icon: Icon(Icons.my_location),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GoogleMap gmapMethod() {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
