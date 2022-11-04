import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../presentaion/screens/home.dart';
import '../presentaion/screens/news.dart';
import '../presentaion/screens/setting.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int current =0;
  List screens = [
    const HomePage() , const News() , const Setting()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: current,
        onTap: (i) => setState(() => current = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.deepOrange,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.newspaper),
            title: const Text("News"),
            selectedColor: Colors.deepOrange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Setting"),
            selectedColor: Colors.deepOrange,
          ),
        ],
      ),
      body: screens[current],


    );
  }
}
