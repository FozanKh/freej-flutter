import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freej/models/constances.dart';
import 'package:freej/models/freej_lists.dart';
import 'package:freej/models/student.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile(this.student);
  final Student student;
  Map<String, String> param = {};
  String newFName;
  String newLName;
  String newBNo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkPurple,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  height: 70,
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "First Name",
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        gapPadding: 5,
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      newFName = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  height: 70,
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Last Name",
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        gapPadding: 5,
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      newLName = value;
                    },
                  ),
                ),
                Text(
                  'Building',
                  style: kListTextStyle,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width - 100,
                  alignment: Alignment.center,
                  child: CupertinoPicker(
                    backgroundColor: kDarkPurple,
                    itemExtent: 30,
                    onSelectedItemChanged: (index) {
                      newBNo =
                          Provider.of<FreejLists>(context, listen: false).buildings[index].data;
                    },
                    children: Provider.of<FreejLists>(context).buildings,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                kBasicButton(
                  text: 'SUBMIT',
                  onPressed: () async {
                    bool result = await student.updateStudentData(
                        newFName: newFName, newLName: newLName, newBNo: newBNo);

                    if (result) {
                      Provider.of<FreejLists>(context, listen: false).getSessionData(notify: true);
                      Navigator.pop(context);
                    }
                    //TODO: Add else with err statement
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
