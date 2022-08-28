import 'package:flutter/material.dart';
import 'screens/homeScreen/homeScreen.dart';


void main(List<String> args) {
  runApp(pwcApp());
}


class pwcApp extends StatelessWidget {
  const pwcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      // initialRoute: "/homeScreen",
      // routes: {
      //   // "/" : (context) => HomeScreen(),
      //   "/homeScreen" :(context) => HomeScreen()
      // },
    );
  }
}