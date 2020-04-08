import 'package:flutter/material.dart';
import 'package:freej/Screens/Loading_Screen.dart';
import 'package:freej/Screens/SignUp_Screen.dart';
import 'package:freej/Screens/SignIn_Screen.dart';
import 'package:freej/Screens/Verify_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BalooDa2'),
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      initialRoute: LoadingScreen.route,
      routes: {
        LoadingScreen.route: (context) => LoadingScreen(),
        SignInScreen.route: (context) => SignInScreen(),
//        SignUpScreen.route: (context) => SignUpScreen(),
      },
    );
  }
}
