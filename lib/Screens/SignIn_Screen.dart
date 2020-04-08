import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freej/NetworkManagement/SignIn_Controller.dart';
import 'package:freej/Screens/Main_Screen.dart';
import 'package:freej/models/constances.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:freej/Screens/SignUp_Screen.dart';
import 'package:freej/Screens/Verify_Screen.dart';

class SignInScreen extends StatefulWidget {
  static const route = 'SignInScreen';
  static String id;
  static String getId() => id;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String id = SignInScreen.getId();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: SafeArea(
        child: Scaffold(
          backgroundColor: k_DarkPurple,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Freej",
                style: k_LargeTextStyle,
              ),
              SizedBox(height: 200),
              k_PlaceHolder(BeautyTextfield(
                placeholder: 'Enter KFUPM ID',
                cornerRadius: BorderRadius.all(Radius.circular(20)),
                margin: EdgeInsets.all(0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                prefixIcon: Icon(Icons.perm_identity),
                inputType: TextInputType.text,
                onChanged: (value) {
                  id = value;
                },
              )),
              k_BasicButton(
                  text: 'SignIn',
                  onPressed: () async {
                    SignInController sign = SignInController(id: id);
                    if (id != null) {
                      if (false) {
//                      if (await sign.isSignedUp(ID: id)) {
                        var result = await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => VerifyScreen(id: id)));
                        if (result)
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MainScreen(id)));
                      } else {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding:
                                  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: SignUpScreen(),
                            ),
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
