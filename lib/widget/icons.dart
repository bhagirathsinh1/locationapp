// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locationapp/screens/google_map.dart';

class IconWidget extends StatelessWidget {
  IconWidget(
      {Key? key,
      required this.iconText,
      required this.iconName,
      required this.boxShadow})
      : super(key: key);
  final String iconText;
  final IconData? iconName;
  final bool boxShadow;
  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      shape: CircleBorder(),
      child: Container(
        height: 90,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: boxShadow
                ? [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                      offset: Offset(0, 0),
                    ),
                  ]),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  iconName,
                  size: 40,
                  color: Colors.blue,
                ),
                SizedBox(height: 10),
                Text(
                  iconText,
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
