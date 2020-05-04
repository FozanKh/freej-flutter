import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const getStudentURL = "http://freejapp.com/FreejAppRequest/GetStudent.php";
const UpdateStudentInfoURL = 'http://freejapp.com/FreejAppRequest/UpdateUserInfo.php';
const DeleteStudentURL = 'http://freejapp.com/FreejAppRequest/DeleteStudent.php';

class Student {
  final KFUPMID;
  String UserID;
  String BNo;
  String FName;
  String LName;
  String Gender;
  String Stat;
  bool isAmeen;

  Student({@required this.KFUPMID});

  getStudentData() async {
    http.Response response = await http.post(getStudentURL, body: {'KFUPMID': this.KFUPMID});
    var data = await jsonDecode(response.body)[0];
    this.UserID = data['UserID'];
    this.BNo = data['BNo'];
    this.FName = data['FName'];
    this.LName = data['LName'];
    this.Gender = data['Gender'];
    this.Stat = data['Stat'];
    this.isAmeen = (data['IsAmeen'] == 'false') ? false : true;
  }

  Future<bool> updateStudentData({String newFName, String newLName, String newBNo}) async {
    var param = {
      'KFUPMID': KFUPMID,
      'FName': (newFName != null) ? newFName : FName,
      'LName': (newLName != null) ? newLName : LName,
      'BNo': (newBNo != null) ? newBNo : BNo
    };
    http.Response response = await http.post(UpdateStudentInfoURL, body: param);
    if (response.statusCode == 201) {
      getStudentData();
      return true;
    } else
      return false;
  }

  Future<bool> deleteStudent() async {
    http.Response response = await http.post(DeleteStudentURL, body: {'KFUPMID': KFUPMID});
    if (response.statusCode == 201)
      return true;
    else
      return false;
  }
}
