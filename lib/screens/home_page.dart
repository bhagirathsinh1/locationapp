// ignore_for_file: unnecessary_new, sized_box_for_whitespace, prefer_const_constructors, prefer_final_fields

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locationapp/screens/google_map.dart';
import 'package:locationapp/widget/icons.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.437935, 70.601010),
    zoom: 1,
  );
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hi, Alejandro',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '255,900',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.add_box,
                color: Colors.blue,
                size: 40,
              ),
              onPressed: () {/* Your code */},
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: constraints.maxWidth * 0.90,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              mapType: MapType.hybrid,
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -60,
                          child: Container(
                            // color: Colors.red,
                            width: constraints.maxWidth,
                            height: constraints.maxWidth * 0.25,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        PageTransition(
                                            duration: Duration(seconds: 1),
                                            type:
                                                PageTransitionType.topToBottom,
                                            child: GoogleMapSample())),
                                    child: IconWidget(
                                      boxShadow: true,
                                      iconText: 'Car',
                                      iconName: Icons.car_repair,
                                    ),
                                  ),
                                  IconWidget(
                                      boxShadow: true,
                                      iconText: 'Bike',
                                      iconName: Icons.directions_bike),
                                  IconWidget(
                                      boxShadow: true,
                                      iconText: 'Box',
                                      iconName: Icons.add_box),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      height: constraints.maxWidth * 0.60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconWidget(
                                  boxShadow: false,
                                  iconText: 'food',
                                  iconName: Icons.dinner_dining_outlined),
                              IconWidget(
                                  boxShadow: false,
                                  iconText: 'Flight',
                                  iconName: Icons.airplanemode_active),
                              IconWidget(
                                  boxShadow: false,
                                  iconText: 'Hotel',
                                  iconName: Icons.hotel_outlined)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconWidget(
                                boxShadow: false,
                                iconText: 'Mall',
                                iconName: Icons.shopping_cart_outlined,
                              ),
                              IconWidget(
                                  boxShadow: false,
                                  iconText: 'Top Up',
                                  iconName: Icons.touch_app_outlined),
                              IconWidget(
                                  boxShadow: false,
                                  iconText: 'View All',
                                  iconName: Icons.view_comfortable),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
