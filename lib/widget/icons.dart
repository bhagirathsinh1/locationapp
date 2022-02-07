import 'package:flutter/material.dart';

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
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
