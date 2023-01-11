import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/homePage.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/profile.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/userResponseOnMyQuestion.dart';

class AdminBottomNavigation extends StatefulWidget {
  AdminBottomNavigation({
    super.key,
  });

  @override
  State<AdminBottomNavigation> createState() => _AdminBottomNavigation();
}

List<Widget> pages = [HomePage(), UserResponse(), Profile()];

class _AdminBottomNavigation extends State<AdminBottomNavigation> {
  int selectedItem = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: selectedItem,
              // showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.blue,
              onTap: (int index) {
                setState(() {
                  selectedItem = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.analytics_outlined,
                    color: Colors.blue,
                  ),
                  label: "analysis",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.blue),
                  label: "Profile",
                ),
              ]),
        ),
        body: pages.elementAt(selectedItem),
      );
    });
  }
}
