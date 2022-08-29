import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu), 
        onPressed: () {  },)
      ),
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[ 
          HeaderWithSearchBar(size: size),
          CategoriesList(size: size)
        ],
      ),
    )
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          height: size.height * 0.2,
          width: size.width,
          // color: Colors.red,  
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/istockphoto-1181366400-612x612.jpeg",
                    fit: BoxFit.cover,
                  ),
                ), 
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 0,
                child: Text(
                  "Category Name", 
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                ))
            ]),
        );
      },);
  }
}

class HeaderWithSearchBar extends StatelessWidget {
  const HeaderWithSearchBar({
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
        color: Colors.blue,
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
                "Park",
                style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
              ),
              Text(
                "with a ",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
              ),
              Text(
                "ConScience",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
              ),
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
              blurRadius: 50,
              color: Colors.blue.withOpacity(0.3 )
            ) 
          ],
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.blue.withOpacity(0.5)
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {  },)
            ),
          ),
        ),
      )
    )
        ]),
    );
  }
}