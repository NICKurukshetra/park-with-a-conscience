import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
    { required this.title, required this.imagePath, required this.aboutContent});

  final String title;
  final String imagePath;
  final String aboutContent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
          
        ),
        body: Column(
          children: [
            Container(
              height: size.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover
                  )),
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green.withOpacity(.6),
                    Colors.white.withOpacity(.6),
                 ]),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  aboutContent,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,

                  )
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}



