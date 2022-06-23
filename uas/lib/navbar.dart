import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uas/like.dart';

import 'main.dart';

class NavBar extends StatefulWidget {
  final int? a;
  const NavBar({Key? key, this.a}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int current_index_navbar = 0;

  @override
  void initState() {
    if (widget.a != null) {
      current_index_navbar = widget.a!;
    } else {
      current_index_navbar = 0;
    }
    super.initState();
  }

  final screen_navbar = [
    MyApp(),
    //LoginPage(),
    Like(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          iconSize: 28,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedFontSize: 12,
          currentIndex: current_index_navbar,
          onTap: (index) => setState(() {
            current_index_navbar = index;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Like',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        body: IndexedStack(
          index: current_index_navbar,
          children: screen_navbar,
        ));
  }
}
