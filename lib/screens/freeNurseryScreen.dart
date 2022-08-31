import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class NurseryScreen extends StatefulWidget {
  const NurseryScreen({Key? key}) : super(key: key);

  @override
  State<NurseryScreen> createState() => _NurseryScreenState();
}

class _NurseryScreenState extends State<NurseryScreen> {
  bool isLoading = true;
  List<String> imageUrls = ['https://drive.google.com/uc?id=16SToMgqFqPen737R0s5qJTPpWUGDa8B4',"https://drive.google.com/uc?id=1pF59wpclzaYGTfYGGLKmQj96LL4_aV46"];
  
  List<Image> allImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImages();
    
  }

  Future loadImages() async {
    Image _image = Image(image: AssetImage("assets/images/istockphoto-1181366400-612x612.jpeg"));
    allImages.add(_image);
    for(String url in imageUrls) {
      _image = Image.network(url.toString());
      allImages.add(_image);
    }
    _image.image.resolve(ImageConfiguration())
    .addListener(ImageStreamListener(
      (ImageInfo info, bool syncCall) => setState(() {
        isLoading = false;
      })));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? StaggeredGridView.countBuilder(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: 20,
        crossAxisCount: 3,
        staggeredTileBuilder: (index) => StaggeredTile.count(
           (index % 4 == 0) ? 2 : 1, (index % 4 == 0) ? 2 : 1
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            child: Container(color:Colors.black), 
            baseColor: Color.fromARGB(149, 158, 158, 158), 
            enabled: isLoading,
            highlightColor: Colors.grey
          );
        },
      ) : StaggeredGridView.countBuilder(
        crossAxisCount: 3, 
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
            
            ),
            child: allImages[index],
          );
        }
      ), 
        staggeredTileBuilder: (index) => StaggeredTile.count(
           (index % 4 == 0) ? 2 : 1, (index % 4 == 0) ? 2 : 1
        ),

      ),
    );
  }
}





/*
StaggeredGridView.countBuilder(
        crossAxisCount: 3, 
        itemCount: 20,
        itemBuilder: ((context, index) {
          return Container(color: Colors.amber, height: size.height*0.2, margin: EdgeInsets.all(10),);
        }), 
        staggeredTileBuilder: (index) => StaggeredTile.count(
           (index % 4 == 0) ? 2 : 1, (index % 4 == 0) ? 2 : 1
        ),

      ),






 ListWheelScrollView(
        itemExtent: 250,
        physics: FixedExtentScrollPhysics(),
        perspective: 0.001,
        children: [
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
          Container(color: Colors.amber,height: size.height*0.2,margin: EdgeInsets.only(bottom: 10),),
        ]),
*/