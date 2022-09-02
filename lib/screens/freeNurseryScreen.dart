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
  List<String> imageUrls = [
    
    "https://drive.google.com/uc?id=10wuAGbkpu313I2s1AXtr8mVTlwPigql_", 
    "https://drive.google.com/uc?id=19kNMIPeFKMY1cvd9TvSWEzVRYOLDJsgI", 
    "https://drive.google.com/uc?id=1FO5zSWFKs_ia9C2tFa-y3988wnxi6CGu", 
    "https://drive.google.com/uc?id=1J_fmOP0Q_DrslGU3pIwk_EwmCXUvz1iT", 
    "https://drive.google.com/uc?id=1MmWSZGkivKEBsEeot_PtpWTiLKt95Dbq", 
    "https://drive.google.com/uc?id=1fRDkRZrND-3TFbqidC5DQVlVqk2u_Tea", 
    "https://drive.google.com/uc?id=1mPVQnYKnxKCEd37kbRWYraa6PfS037A8", 
    "https://drive.google.com/uc?id=1oq8E-ds_fel0sNcfMOYjpQUEBKEO04Gb", 
    "https://drive.google.com/uc?id=1q9AucKiLJ4G8NK_JM_nCTES7S0PCZoxn", 
    "https://drive.google.com/uc?id=1rGN4-Uu0TOHPb7nj0pQSubtu5b4XH8PL", 
    "https://drive.google.com/uc?id=1rir0FlURfU4Hqj90fcasEYyqPeM2YSER", 
    "https://drive.google.com/uc?id=1tto3_y8tsXI3zyj1YLzVztmvYZ3Qb1Wp"
  ];
  
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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        // appBar: AppBar(),
        body: isLoading 
        ? Column(
          children: [
            Shimmer.fromColors(
            child: Container(
              color:Colors.black, 
              height: size.height * 0.125, 
              margin: EdgeInsets.only(bottom: 10)), 
            baseColor: Color.fromARGB(149, 158, 158, 158), 
            enabled: isLoading,
            highlightColor: Colors.grey
          ),
            Expanded(child: AnimationGridView(isLoading: isLoading)),
          ],
        ) 
        : Column(
          children: [
            // Container(height: size.height * 0.2, color: Colors.black,),
            Container(
              child: Text("Free Nursery, Anyone can take any plant they want. No cost nursery. Plants are grown using already existing plants."), 
              height: size.height * 0.125, 
              margin: EdgeInsets.only(bottom: 10)
            ),
            Expanded(child: ImagesGridView(allImages: allImages)),
          ],
        ),
      ),
    );
  }
}

class ImagesGridView extends StatelessWidget {
  const ImagesGridView({
    Key? key,
    required this.allImages,
  }) : super(key: key);

  final List<Image> allImages;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3, 
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: allImages.length - 1,
      itemBuilder: ((context, index) {
        return Container(
          child: allImages[index + 1],
        );
      }
    ), 
      staggeredTileBuilder: (index) => StaggeredTile.count(
         (index % 5 == 0) ? 2 : 1, (index % 5 == 0) ? 2 : 1
      ),

    );
  }
}

class AnimationGridView extends StatelessWidget {
  const AnimationGridView({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: 20,
      crossAxisCount: 3,
      staggeredTileBuilder: (index) => StaggeredTile.count(
         (index % 5 == 0) ? 2 : 1, (index % 5 == 0) ? 2 : 1
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          child: Container(color:Colors.black), 
          baseColor: Color.fromARGB(149, 158, 158, 158), 
          enabled: isLoading,
          highlightColor: Colors.grey
        );
      },
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