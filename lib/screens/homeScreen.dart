import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:park_with_conscience/data/homeScreenCategories.dart';
import 'package:park_with_conscience/model/home_screen_categories.dart';
import 'package:park_with_conscience/screens/plantScreen.dart';

 List<dynamic>? AllJsonData;
 bool isLoading = true;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  
  Future<void> readJson() async {
    final String dataString = await rootBundle.loadString('assets/json/plantInfo.json');
    AllJsonData = json.decode(dataString);
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
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ 
            HeaderWithDropDown(size: size),
            CategoriesList(size: size)
          ],
        ),
      )
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
              side: BorderSide(
                color: Colors.black, 
                width: 4
              )
            ),
            child: Container(
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
                        backgroundColor: Color.fromARGB(80, 255, 255, 255)
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
                  "Park with a ConScience",
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 40,
                    color: Colors.green.withOpacity(0.6)
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
 

  

  @override
  Widget build(BuildContext context) {
    int totalPlants = isLoading ? 15 : AllJsonData!.length;
    List<String> totalPlantsList = List<String>.generate(totalPlants, (i) => i.toString().padLeft(3,'0') , growable: true);
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 10,
        hint: Text("Select Plant Code"),
        // value: plantCode,
        isExpanded: true,
        // iconDisabledColor: Colors.green,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.green, size: 40,),
        items: totalPlantsList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              isLoading ? "$value :" : "$value : ${AllJsonData![int.parse(value)]['Plant Name:']}", 
              style: TextStyle(fontSize: 20),
            ),
          );
        }).toList(), 
        onChanged: (String? newValue) {
          setState(() {
            plantCode = newValue!;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantScreen(plantCode: int.parse(plantCode),)),
            );
          });
        }
      ),
    );
  }
}