import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';
import 'package:provider/provider.dart';
import 'package:freej/models/freej_lists.dart';

class AddAnnouncement extends StatelessWidget {
  String title = 'General';
  String description;
  String AnTID = '1';
  final titlesList = [
    Text(
      'General',
      style: kListTextStyle,
    ),
    Text(
      'Specific',
      style: kListTextStyle,
    ),
    Text(
      'Technical',
      style: kListTextStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<FreejLists>(
      builder: (context, Freej, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: kInactiveCardColour,
        ),
        padding: EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Write your activity",
              style: kLargeTextStyle.copyWith(fontSize: 30),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 100,
              alignment: Alignment.center,
              child: CupertinoPicker(
                backgroundColor: kInactiveCardColour,
                itemExtent: 30,
                onSelectedItemChanged: (index) {
                  AnTID = (index + 1).toString();
                  title = titlesList[index].data;
                },
                children: titlesList,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 50,
              width: MediaQuery.of(context).size.width - 100,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Description",
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderSide: BorderSide(color: Colors.purple, style: BorderStyle.solid),
                  ),
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
            ),
            SizedBox(height: 10),
            kBasicButton(
              size: 'small',
              text: 'ADD',
              onPressed: () async {
                print('Announcement Title = $title, Description = $description');
                if (description != null && title != null) {
                  bool result = await Freej.addAnnouncement(
                      anTID: AnTID, title: title, description: description);
                  if (result) Navigator.pop(context);
                  //TODO: Add else with err statement
                }
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
