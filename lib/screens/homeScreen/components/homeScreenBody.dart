import 'package:flutter/material.dart';
import 'headerWithSearchBar.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[ 
          HeaderWithSearchBar(size, context),
        ],
      ),
    );
  }
}