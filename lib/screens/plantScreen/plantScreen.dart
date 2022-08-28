import 'package:flutter/material.dart';
import 'components/plantScreenBody.dart';


class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PlantScreenBody(),
    );
  }
}