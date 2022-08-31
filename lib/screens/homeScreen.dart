import 'package:flutter/material.dart';
import 'package:park_with_conscience/data/homeScreenCategories.dart';
import 'package:park_with_conscience/model/home_screen_categories.dart';
import 'package:park_with_conscience/screens/plantScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.menu), 
          onPressed: () {  },)
        ),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.green, width: 3) ),
            child: Container(
              margin: EdgeInsets.all(10),
              height: widget.size.height * 0.2,
              width: widget.size.width,
              // color: Colors.red,  
              child: Stack(
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
                    bottom: 1,
                    left: 5,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black
                      ),
                      child: Text(
                        allCategories[index].name, 
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
      height: size.height * 0.2,
      color: Colors.white,
      child: Stack(
        children: [
    Container(
      height: size.height * 0.2-27,
      // color: Colors.black,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36)
        ) 
      ),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Arjun Complex",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
              ),
              Row(
                children: [
                  Text(
                "Park with a ",
                style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
              ),
              Text(
                "ConScience",
                style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
              ),
                ],
              )
              
            ],
          ),
          // Spacer(),
          // CircleAvatar()
        ]
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
              color: Colors.green.withOpacity(0.4)
            ) 
          ],
        ),
        child: DropDownWidget(),
        // child: Center(
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Search",
        //       hintStyle: TextStyle(
        //         color: Colors.blue.withOpacity(0.5)
        //       ),
        //       enabledBorder: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {  },)
        //     ),
        //   ),
        // ),
      )
    )
        ]),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String plantCode = "";
  
  @override
  Widget build(BuildContext context) {
    int totalPlants = 28;
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
            child: Text("$value", style: TextStyle(fontSize: 25),),
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