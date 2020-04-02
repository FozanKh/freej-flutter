import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
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
                child: Text('Activities', style: k_LargeTextStyle),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: Text('Requests',
                          textAlign: TextAlign.center,
                          style: k_LargeTextStyle.copyWith(fontSize: 20))),
                  Expanded(
                      child: Text('Services',
                          textAlign: TextAlign.center,
                          style: k_LargeTextStyle.copyWith(fontSize: 20))),
                  Expanded(
                      child: Text('Maintenance',
                          textAlign: TextAlign.center,
                          style: k_LargeTextStyle.copyWith(fontSize: 20))),
                ],
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
//            )
          ],
        ),
      ),
    );
  }
}
