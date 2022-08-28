import 'package:flutter/material.dart';
import 'components/homeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SearchBar()
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu), 
        onPressed: () {  },)
    );
  }
}