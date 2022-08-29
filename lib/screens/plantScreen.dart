import 'package:flutter/material.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          PlantScreenHeader(size,context),
          PlantInfoGrid(size: size)
        ],
      )
    );
  }
}

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

  class PlantInfoGrid extends StatelessWidget {
  const PlantInfoGrid({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
          InfoCard(size: size),
        ],
        
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25) 
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Icon(
            Icons.sunny,
            size: size.width*0.12
          )
        ),
        Positioned(
          top: size.height * 0.07,
          left: 10,
          child: Container(
            color: Colors.white,
            height: size.height*0.04,
            width: size.width*0.25,
            child: Expanded(
              child: Text(
                "Full sun",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ),
        Positioned(
          bottom: 10,
          child: Text(
            "SUNLIGHT",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold
            ),
          ))
      ]);
  }
}