import 'package:flutter/material.dart';
import 'package:my_app/screens/landingScreen.dart';

class moreTab extends StatefulWidget {
  @override
  _moreTabState createState() => _moreTabState();
}

class _moreTabState extends State<moreTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => landingScreen()),
            );
          },
          child: null),
    );
  }
}