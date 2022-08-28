import 'package:flutter/material.dart';
import 'headerWithSearchBar.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[ 
          HeaderWithSearchBar(size, context),
          ListView.builder(
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
            },)
          // Container(
          //   margin: EdgeInsets.only(bottom: 10),
          //   height: size.height * 0.2,
          //   width: size.width,
          //   color: Colors.red,
          // ),
        ],
      ),
    );
  }
}