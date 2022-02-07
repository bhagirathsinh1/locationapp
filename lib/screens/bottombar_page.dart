// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:locationapp/screens/home_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _currentPage = 0;
  static bool _init = false;
  get inits => _init;
  bool willpop = false;

  final _pageController = PageController(keepPage: false);
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exit(0);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: _pageController,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            HomePage(),
            // GoogleMapSample(),
            // Favouritepage(),
          ],
          onPageChanged: (index) {
            _init = true;
            setState(
              () => _currentPage = index,
            );
          },
        ),
        bottomNavigationBar: BottomBar(
          backgroundColor: Colors.blue,
          // showActiveBackgroundColor: true,
          selectedIndex: _currentPage,
          onTap: (int index) {
            _pageController.jumpToPage(index);

            setState(
              () {
                _init = true;
                _currentPage = index;
              },
            );
          },
          items: <BottomBarItem>[
            BottomBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white70,
              ),
              title: Text(''),
              activeColor: Colors.white,
            ),
            BottomBarItem(
              icon: Icon(
                Icons.email_outlined,
                size: 30,
                color: Colors.white70,
              ),
              title: Text(''),
              activeColor: Colors.white,
            ),
            BottomBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: Colors.white70,
              ),
              title: Text(''),
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
