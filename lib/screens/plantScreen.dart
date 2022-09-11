import 'package:flutter/material.dart';
import 'package:park_with_conscience/model/plant_information.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;


class PlantScreen extends StatefulWidget {
  // final String plantCode;
  final Plant plantInfoModel;
  
  const PlantScreen(
    {
      super.key, 
      // required this.plantCode, 
      required this.plantInfoModel
    }
  ); 
  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {

  Image? plantImage;
  bool isLoading = true;
  late Plant plantInfo;
  
  
  Future<void> loadPlantInfo() async {
    // final String dataString = await rootBundle.loadString('assets/json/plantInfo.json');
    // var dataString = http.get(Uri.parse("http://103.87.24.58/stockapi/Plant"));
    // final data = json.decode(dataString);
    // final plantInfoModel = plantFromJson(dataString.toString());

    plantImage = Image.network(widget.plantInfoModel.image, fit: BoxFit.cover);
    plantImage!.image.resolve(ImageConfiguration())
    .addListener(ImageStreamListener(
      (ImageInfo info, bool syncCall) => setState(() {
        isLoading = false;
      })));
    setState(() {
    // plantInfo = plantInfoModel.where((element) => element.code==widget.plantCode).toList().first;
    // index = plantCode;
    plantInfo = widget.plantInfoModel;
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPlantInfo();
  }

  @override
  Widget build(BuildContext context) {
    // widget.plantCode;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color.fromARGB(243, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlantScreenHeader(
              size: size, 
              plantName: plantInfo.plantName, plantsImage: plantImage, isLoading: isLoading, /*plantCommonName:plantInfo. ,*/),
            // PlantInfoGrid(size: size),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                InfoCard(size: size, cardName: 'sunlight', icon: Icons.wb_sunny_outlined, iconColor: Colors.amber, information: plantInfo.sunExposure),
                InfoCard(size: size, cardName: 'water needs', icon: Icons.water_drop_outlined, iconColor: Colors.blue,information: plantInfo.waterNeeds),
                InfoCard(size: size, cardName: 'season', icon: Icons.thermostat, iconColor: Colors.orange,information: plantInfo.season),
                //InfoCard(size: size, cardName: 'size', icon: Icons.nature_people_outlined, iconColor: Colors.green,information: plantInfo?.size??"",),
                InfoCard(size: size, cardName: 'Propagation', icon: Icons.queue, iconColor: Colors.blueGrey,information: plantInfo.propagation.replaceAll(RegExp('\\(.*?\\)'), '')),
                InfoCard(size: size, cardName: 'Propagation Season', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type),
                InfoCard(size: size, cardName: 'type', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type.replaceAll(RegExp('\\(.*?\\)'), '')),
                InfoCard(size: size, cardName: 'Flowering', icon: Icons.filter_vintage, iconColor: Colors.lightGreen,information: plantInfo.flowering),
                InfoCard(size: size, cardName: 'Flowering Season', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type),
                InfoCard(size: size, cardName: 'Life Cycle', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.lifeCycle),
                InfoCard(size: size, cardName: 'Medicinal', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type),
                InfoCard(size: size, cardName: 'fertilizer', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type),
                InfoCard(size: size, cardName: 'Maintainace', icon: Icons.grass, iconColor: Colors.lightGreen,information: plantInfo.type),
              ],
              
              ),
            PlantInfoText(size: size, aboutPlant: plantInfo.about)
          ],
        ),
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
    required this.aboutPlant,
  }) : super(key: key);

  final Size size;
  final String aboutPlant;
  // final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      // height: size.height * 0.24,
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

          ReadMoreText(
            aboutPlant, 
            trimLines: 4, 
            textAlign: TextAlign.justify, 
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show more ",
            trimExpandedText: " Show less ",
            style: TextStyle(
              fontSize: 18,
            ),
          )
          // Text(
          //   aboutPlant,
          //   style: Theme.of(context).textTheme.caption,
          // )
        ]),
      
    );
  }
}

class PlantScreenHeader extends StatelessWidget {
  const PlantScreenHeader({
    Key? key,
    required this.size,
    required this.plantName,
    required this.plantsImage,
    required this.isLoading,
    // required this.plantCommonName,
  }) : super(key: key);

  final Size size;
  final String plantName;
  final Image? plantsImage;
  final bool isLoading;
  // final String plantCommonName;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: size.height * 0.43,
        child: isLoading 
        ? Shimmer.fromColors(
          child: Container(color:Colors.black), 
          baseColor: Colors.green, 
          enabled: isLoading,
          highlightColor: Colors.lightGreen
        )
        : plantsImage,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover,
        //   ),
        // ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plantName, 
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              backgroundColor: Color.fromARGB(150, 0, 0, 0) 
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
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
          Text(
            cardName.toUpperCase(),
            textScaleFactor: 0.6,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
    );
  }
}