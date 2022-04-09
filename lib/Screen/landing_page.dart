// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo1/widgets/btm_nav.dart';
import 'package:flutter_demo1/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'Home.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          physics:
              NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Center(
              child: HomePage1(),
            ),
            const Center(
              child: Text("Service"),
            ),
            const Center(
              child: Text("Profile"),
            ),
            const Center(
              child: Text("Settings"),
            ),
          ],
        ),
        drawer: Drawer1(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("HomePage"),
          backgroundColor: Colors.red,
        ),
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Home",
          useSafeArea: true, // default: true, apply safe area wrapper
          labels: const ["Home", "Service", "Tour", "Explore"],
          icons: const [
            Icons.home,
            Icons.handyman,
            Icons.car_rental,
            Icons.map
          ],

          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          tabIconColor: Color.fromARGB(255, 0, 0, 0),
          tabIconSize: 28.0,
          tabIconSelectedSize: 26,
          tabSelectedColor: Color.fromARGB(255, 255, 255, 255),
          tabIconSelectedColor: Color.fromARGB(255, 0, 0, 0),
          tabBarColor: Colors.redAccent,
          onTabItemSelected: (int value) {
            setState(() {
              _tabController!.index = value;
            });
          },
        ));
  }
}
