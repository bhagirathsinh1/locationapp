// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locationapp/screens/bottombar_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BottomBarPage',
          home: BottomBarPage(),
        );
      },
    );
  }
}
