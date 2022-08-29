import 'package:flutter/material.dart';

Container PlantScreenHeader(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.43,
      color: Colors.green,
      child: Stack(children: [
        Container(
          height: size.height * 0.43,
          // color: Colors.black,
          decoration: BoxDecoration(
            // color: Colors.green,
            // borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage('assets/images/istockphoto-1181366400-612x612.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
              "Aloe Vera", 
              style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
              ),
             Text(
              "Aloe Vera",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white
              )
            ) 
            ],))
      ]),
    );
  }