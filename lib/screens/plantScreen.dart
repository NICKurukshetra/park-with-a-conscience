// import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:park_with_conscience/model/plant_information.dart';


class PlantScreen extends StatefulWidget {
  final int plantCode;
  
  const PlantScreen({super.key, required this.plantCode}); 
  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {


  PlantInfoModel? plantInfo;
  
  
  Future<void> readJson( int index) async {
    final String dataString = await rootBundle.loadString('assets/json/plantInfo.json');
    // final data = json.decode(dataString);
    final plantInfoModel = plantInfoModelFromJson(dataString, index);
    setState(() {
    plantInfo = plantInfoModel;
    // index = plantCode;
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int index = widget.plantCode;
    readJson(index);
  }

  @override
  Widget build(BuildContext context) {
    // widget.plantCode;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color.fromARGB(243, 255, 255, 255),
      body: Column(
        children: [
          PlantScreenHeader(
            size: size, 
            plantName: plantInfo?.plantName??"", imageUrl: plantInfo?.image??"", /*plantCommonName:plantInfo. ,*/),
          // PlantInfoGrid(size: size),
          Expanded(
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          InfoCard(size: size, cardName: 'sunlight', icon: Icons.wb_sunny_outlined, iconColor: Colors.amber, information: plantInfo?.sunExposure??"",),
          InfoCard(size: size, cardName: 'water needs', icon: Icons.water_drop_outlined, iconColor: Colors.blue,information: plantInfo?.waterNeeds??"",),
          InfoCard(size: size, cardName: 'season', icon: Icons.thermostat, iconColor: Colors.orange,information: plantInfo?.season??"",),
          InfoCard(size: size, cardName: 'size', icon: Icons.nature_people_outlined, iconColor: Colors.green,information: plantInfo?.type??"",),
          InfoCard(size: size, cardName: 'maintenance', icon: Icons.content_cut, iconColor: Colors.blueGrey,information: plantInfo?.code3NumericDigits??"",),
          InfoCard(size: size, cardName: 'type', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo?.type??"",),
        ],
        
      ),
    ),
          PlantInfoText(size: size)
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.arrow_back, 
          color: Colors.white,
          size: size.width*0.07,
          ), 
        onPressed: () {
          Navigator.of(context).pop(context);
        }
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
  // final String info;

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
    required this.plantName,
    required this.imageUrl,
    // required this.plantCommonName,
  }) : super(key: key);

  final Size size;
  final String plantName;
  final String imageUrl;
  // final String plantCommonName;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: size.height * 0.43,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage(imageUrl),
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
            plantName, 
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),
    ],))
    ]);
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.size,
    required this.icon,
    required this.iconColor,
    required this.cardName,
    required this.information,
  }) : super(key: key);

  final Size size;
  final Color iconColor;
  final IconData icon;
  final String cardName;
  final String information;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon, 
            size: size.width * 0.1,
            color: iconColor,
          ),
          Text(
            information,
            // overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: iconColor,
            ),
          ),
          Text(
            cardName.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold
            ),
          )
        ]),
    );
  }
}