import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/homepage_copy.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/setting.dart';
class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomePage2(),
    SettingPages(),
    ProfilePage(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.settings,color: Colors.white,),
    Icon(Icons.person,color: Colors.white,),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: primaryColor,

        buttonBackgroundColor:primaryColor,
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}