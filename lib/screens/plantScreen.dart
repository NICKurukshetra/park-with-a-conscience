import 'package:flutter/material.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color.fromARGB(243, 255, 255, 255),
      body: Column(
        children: [
          PlantScreenHeader(size: size),
          PlantInfoGrid(size: size),
          PlantInfoText(size: size)
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.arrow_back, 
          color: Colors.white,
          size: size.width*0.07,
          ), 
        onPressed: () {}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class PlantInfoText extends StatelessWidget {
  const PlantInfoText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: size.height * 0.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About this plant",
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 10,),
          Text(
            "Clita kasd gubergren et sit ipsum nonumy nonumy invidunt. Voluptua diam dolor clita sed eos amet, amet at et stet diam lorem et at takimata dolor, aliquyam clita rebum consetetur clita sed justo et ut. Vero sed dolores diam sea et diam lorem lorem. Magna sea ut diam sea justo..",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]),
      
    );
  }
}

class PlantScreenHeader extends StatelessWidget {
  const PlantScreenHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.43,
      color: Colors.green,
      child: Stack(children: [
        Container(
    height: size.height * 0.43,
    decoration: BoxDecoration(
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
        physics: NeverScrollableScrollPhysics(),
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
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.sunny, 
            size: size.width * 0.1,
            color: Colors.amber,
          ),
          Text(
            "Information",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.amber,
            ),
          ),
          Text(
            "SUNLIGHT",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold
            ),
          )
        ]),
    );
  }
}