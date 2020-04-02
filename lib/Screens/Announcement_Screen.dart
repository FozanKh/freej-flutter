import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: k_DarkPurple,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Announcement', style: k_LargeTextStyle),
              ),
            ),
            Expanded(
              flex: 15,
//              child: GestureDetector(
              child: k_BackgroundContainer(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                    k_ActivityCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
