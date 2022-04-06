// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

class BtmNav extends StatefulWidget {
  const BtmNav({Key? key}) : super(key: key);

  @override
  _BtmNavState createState() => _BtmNavState();
}

class _BtmNavState extends State<BtmNav> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
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
    return MotionTabBar(
      initialSelectedTab: "Home",
      useSafeArea: true, // default: true, apply safe area wrapper
      labels: const ["Home", "Service", "Tour", "Explore"],
      icons: const [Icons.home, Icons.handyman, Icons.car_rental, Icons.map],

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
    );
  }
}
