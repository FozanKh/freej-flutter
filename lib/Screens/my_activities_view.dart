import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';
import 'package:freej/models/freej_lists.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
class MyActivitiesView extends StatefulWidget {
  final UserID;
  MyActivitiesView(this.UserID);
  @override
  _MyActivitiesViewState createState() => _MyActivitiesViewState();
}

class _MyActivitiesViewState extends State<MyActivitiesView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FreejLists>(
      builder: (context, Freej, child) => SafeArea(
        child: Scaffold(
          backgroundColor: kDarkPurple,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text('My Activities', style: kLargeTextStyle),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 15,
                child: kBackgroundContainer(
                  margin: EdgeInsets.fromLTRB(10, 25, 10, 50),
                  position: 'alone',
                  color: Colors.white,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Freej.getStudentActivities();
                    },
                    child: ListView(
                      children: Freej.studentActivities,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
