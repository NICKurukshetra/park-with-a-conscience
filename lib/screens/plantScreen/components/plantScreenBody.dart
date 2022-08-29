
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'plantScreenHeader.dart';

class PlantScreenBody extends StatelessWidget {
  const PlantScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      PlantScreenHeader(size, context)
    ]);
  }

  
}