import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/data/network_util.dart';
import 'package:my_app/screens/onboarding_screen.dart';


void main() {
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}
void setupLocator() {
  GetIt.I.registerLazySingleton(() => Services());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      //initialRoute: '/',
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => LoginScreen(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
//      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.lightBlue
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
