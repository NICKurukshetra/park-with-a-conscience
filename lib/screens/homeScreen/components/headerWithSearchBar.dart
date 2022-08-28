import 'package:flutter/material.dart';

Container HeaderWithSearchBar(Size size, BuildContext context) {
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


