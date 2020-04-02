import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';
import 'package:freej/Screens/Announcement_Screen.dart';
import 'package:freej/Screens/Profile_Screen.dart';
import 'package:freej/Screens/Activities_Screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen(this.id);
  final id;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    currentScreen = screens[1];
  }

  final screens = [AnnouncementScreen(), ActivitiesScreen(), ProfileScreen()];
  Widget currentScreen;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: SafeArea(
        child: Scaffold(
            backgroundColor: k_DarkPurple,
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 300),
              height: 60,
              backgroundColor: k_DarkPurple,
              color: Colors.white,
              items: <Widget>[
                Icon(Icons.all_out, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.settings, size: 30),
              ],
              onTap: (index) async {
                setState(() {
                  currentScreen = screens[index];
                });
                //Handle button tap
              },
            ),
            body: currentScreen),
      ),
    );
  }
}
