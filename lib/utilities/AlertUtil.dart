
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,String Title, String message) {

  showDialog(
      context: context,
      child:  CupertinoAlertDialog(
        title: Text(Title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                //Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).pop("Discard");
              },
              //isDestructiveAction: true,
              child: Text("Ok")
          ),
//          CupertinoDialogAction(
//              textStyle: TextStyle(color: Colors.red),
//              isDefaultAction: true,
////              onPressed: () async {
////                Navigator.pop(context);
////                SharedPreferences prefs = await SharedPreferences.getInstance();
////                prefs.remove('Ok');
////                Navigator.pushReplacement(context,
////                    MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
////              },
//              child: Text("Log out")
//          ),
        ],
      ));
}