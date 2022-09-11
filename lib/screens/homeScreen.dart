import 'package:flutter/material.dart';
import 'package:park_with_conscience/data/drawerCategories.dart';
import 'package:park_with_conscience/data/homeScreenCategories.dart';
import 'package:park_with_conscience/model/home_screen_categories.dart';
import 'package:park_with_conscience/model/plant_information.dart';
import 'package:park_with_conscience/screens/imageGalleryScreen.dart';
import 'package:park_with_conscience/screens/plantScreen.dart';
import 'package:http/http.dart' as http;

 List<Plant>? allJsonData;
 bool isLoading = true;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  
  readJson() async {
    // final String dataString = await rootBundle.loadString('assets/json/plantInfo.json');
    // allJsonData = json.decode(dataString);
    // var dataString = await http.get(Uri.parse("http://103.87.24.58/stockapi/Plant"));
    var dataString = await http.get(Uri.http("103.87.24.58", "stockapi/Plant")); 
     allJsonData = plantFromJson(dataString.body.toString());
     allJsonData!.sort(((a, b) => int.parse(a.code).compareTo(int.parse(b.code))));
    setState(() {
      isLoading = false;
    });
    // final plantInfoModel = plantInfoModelFromJson(dataString, index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.green, Colors.white]),
      ),
    ),
        ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ 
            HeaderWithDropDown(size: size),
            CategoriesList(size: size)
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                    Colors.green.withOpacity(.7),
                    Colors.green.withOpacity(.6),
                    Colors.white.withOpacity(.7),
                    Colors.white.withOpacity(.7),
                 ]
            ),
          ),
          child: Column(
            children: [
              Image.asset("assets/pngs/ARJUN COMPLEX logo.png"),
              Divider( thickness: 1, color: Colors.black,),
              ListTile(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ),
                leading: Icon(Icons.park),
                title: Text("Park Photos", style: TextStyle(fontSize: 20),),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[0]))
                )),
              ),
              ListTile(
                title: Text("NewsPaper Cuttings", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.description),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[1]))
                )),
              ),
              ListTile(
                title: Text("Visitors", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.groups),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[2]))
                )),
              ),
              ListTile(
                title: Text("Facilitation Camp (CGC)", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.campaign),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[3]))
                )),
              ),
              ListTile(
                title: Text("Waste craft Event", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.recycling),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[4]))
                )),
              ),
              ListTile(
                title: Text("Playground", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.grass),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[5]))
                )),
              ),
              ListTile(
                title: Text("Selfie Point", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.photo_camera),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[6]))
                )),
              ),
              ListTile(
                title: Text("Yoga Classes", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.self_improvement),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[7]))
                )),
              ),     
              ListTile(
                title: Text("Tools", style: TextStyle(fontSize: 20),),
                leading: Icon(Icons.handyman),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => GalleryScreen(imageUrls: allDrawerImages[8]))
                )),
              ),     
        
            ],
          ),
        ),
      ),
      ),
    );
  }
}


class CategoriesList extends StatefulWidget {
  const CategoriesList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<Details> allCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future loadData() async{
    allCategories = List.of(categories);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allCategories.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => allCategories[index].screenName));
          },
          child: Card( 
            elevation: 10,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
              side: BorderSide(
                color: Colors.black, 
                width: 1,
              )
            ),
            child: Container(
              // color: Colors.amber,
              height: widget.size.height * 0.2,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        allCategories[index].imageAddress,
                        fit: BoxFit.cover,
                      ),
                    ), 
                  ),
                  Positioned(
                    child: Text(
                      allCategories[index].name, 
                      style: Theme.of(context).textTheme.headline5!
                      .copyWith(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold, 
                        backgroundColor: Color.fromARGB(100, 255, 255, 255)
                      ),
                    ))
                ]),
            ),
          ),
        );
      },);
  }
}

class HeaderWithDropDown extends StatelessWidget {
  const HeaderWithDropDown({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      height: size.height * 0.40,
      // color: Colors.white,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            height: size.height * 0.375,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/park.jpeg"),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)
              ) 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Arjun Complex",
                  style: Theme.of(context).textTheme.headline5!
                  .copyWith(
                    color: Colors.white,
                    backgroundColor: Color.fromARGB(50, 0, 0, 0), 
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text(
                  "Park with a Conscience",
                  style: Theme.of(context).textTheme.headline6!
                  .copyWith(
                color: Colors.white,
                backgroundColor: Color.fromARGB(50, 0, 0, 0),  
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 40,
                    color: Colors.green.withOpacity(0.6),
                  ) 
                ],
              ),
              child: DropDownWidget(),
            )
          )
        ]
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
   List<dynamic>? allData;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String plantCode = "";
  var plantData;

  

  @override
  Widget build(BuildContext context) {
    // int totalPlants = isLoading ? 5 : allJsonData!.length;
    // List<String> totalPlantsList = List<String>.generate(totalPlants, (i) => i.toString().padLeft(3,'0') , growable: true);
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 10,
        hint: Text("Select Plant Code"),
        value: "1",
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.green, size: 40,),
        items: allJsonData?.map((Plant item) {
          return new DropdownMenuItem(
            child: Text("${item.code} : ${item.plantName}"),
            value: item.code,
            );
        }).toList(),  
        onChanged: (String? newValue) {
          setState(() {
            plantCode = newValue!;
            // print(plantCode);
            plantData = allJsonData![int.parse(plantCode)-1];
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantScreen(plantInfoModel: plantData)),);
          }
          );
        }
      ),
    );
  }
}