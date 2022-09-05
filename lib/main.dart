import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homeScreen.dart';


void main(List<String> args) {
  runApp(pwcApp());
}


class pwcApp extends StatelessWidget {
  const pwcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}