import 'dart:async';

import 'package:flutter/material.dart';
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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset("assets/pngs/ARJUN COMPLEX logo.png"),
               Positioned(
                 child: SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                      height: 500.0,
                      width: 300.0,
                    ),
               ),
            ],
          ),
        ],
      ),
    );
  }
}