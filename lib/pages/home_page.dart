// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/pages/business.dart';
import 'package:news_api_app/pages/politic_page.dart';
import 'package:news_api_app/pages/sport_page.dart';
import 'package:news_api_app/pages/tech_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenSayfaIndex = 0;
  Widget _secilenSayfa = BusinessPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 12,
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        backgroundColor: Colors.black,
        icons: [
          Icons.business,
          Icons.sports_basketball,
          Icons.computer,
          Icons.language
        ],
        iconSize: 30,
        activeIndex: secilenSayfaIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (int) {
          setState(() {
            secilenSayfaIndex = int;
            if (int == 0) {
              _secilenSayfa = PoliticPage();
            } else if (int == 1) {
              _secilenSayfa = SportPage();
            } else if (int == 2) {
              _secilenSayfa = TechPage();
            } else {
              _secilenSayfa = BusinessPage();
            }
          });
        },
        //other params
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Haberler"),
        centerTitle: true,
      ),
      body: _secilenSayfa,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: null,
        child: Icon(Icons.menu_book),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
