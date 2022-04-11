import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/Home_page.dart';
import 'package:project1/pages/Nav_pages/Nav_bar.dart';
import 'package:project1/pages/Nav_pages/Profile_page.dart';
import 'package:project1/pages/Nav_pages/Search_page.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  List pages = [
    const Home_page(),
    const Nav_bar(),
    const Search_page(),
    const Profile_page(),
  ];
  int current = 0;
  void onTap(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: current,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "MyProfile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
