import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const k_DarkPurple = Color(0xFF0A0E21);
const k_DarkPurplelight = Color(0x550A0E21);
const k_ActiveCardColour = Color(0xFF1D1E33);
const k_InactiveCardColour = Color(0xFF111328);
const k_LargeTextStyle = TextStyle(
  fontSize: 50,
  color: Colors.white70,
  fontFamily: 'BalooDa2',
);

const InputDecoration k_SignUpTFDecoration = InputDecoration(
  counter: Offstage(),
  filled: true,
  hintText: 'Enter KFUPM ID',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

Container k_Loading() => Container(
      height: 50,
      width: 50,
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );

Container k_PlaceHolder(Widget widget, {Color color = null}) => Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)]),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      height: 70,
      width: 330,
      child: widget,
    );

Container k_BasicButton(
    {@required Function onPressed,
    String text = '',
    Color color = Colors.deepPurple,
    double height = 70,
    double width = 330,
    double fontSize = 25,
    String size = 'normal'}) {
  if (size == 'small') {
    height = 40;
    width = 230;
    fontSize = 18;
  }
  return Container(
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)]),
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
    height: height,
    width: width,
    child: RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0.0,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: Colors.white, fontFamily: 'BalooDa2'),
      ),
      onPressed: onPressed,
    ),
  );
}

class k_BackgroundContainer extends StatefulWidget {
  final child;
  final color;
  k_BackgroundContainer({this.child, this.color});
  @override
  _k_BackgroundContainerState createState() => _k_BackgroundContainerState();
}

class _k_BackgroundContainerState extends State<k_BackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: widget.child,
    );
  }
}

class k_ActivityCard extends StatefulWidget {
  @override
  _k_ActivityCardState createState() => _k_ActivityCardState();
}

class _k_ActivityCardState extends State<k_ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.all(10),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.print,
            size: 60,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text('Fozan'
                  '\nI need a colored printer!!!!! Now '),
            ),
          )
        ],
      ),
    );
  }
}
