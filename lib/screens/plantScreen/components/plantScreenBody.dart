
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlantScreenBody extends StatelessWidget {
  const PlantScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        height: size.height * 0.43,
        // color: Colors.green,
        child: Stack(children: [
          Container(
            height: size.height * 0.36,
            // color: Colors.black,
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              image: DecorationImage(
                image: AssetImage('assets/images/istockphoto-1181366400-612x612.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              // padding: EdgeInsets.symmetric(horizontal: 2),
              height: size.height * 0.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                  color: Colors.green.withOpacity(0.7),
                  offset: Offset(0,10),
                  blurRadius: 10
                  )
                ]
              ),
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 15,
                    // left: 15,
                    child: Text(
                      "Name of Plant",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ),
                  Positioned(
                    top: 50,
                    // left: 15,
                    child: Text(
                      "Botanical Name",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ),
                ],
              )
            )
          )
        ]),
      )
    ]);
  }
}