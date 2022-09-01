import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class DrainageScreen extends StatefulWidget {
  const DrainageScreen({Key? key}) : super(key: key);

  @override
  State<DrainageScreen> createState() => _DrainageScreenState();
}

class _DrainageScreenState extends State<DrainageScreen> {
  bool isLoading = true;
  List<String> imageUrls = [
    
    "https://drive.google.com/uc?id=1CVflbhrTk80sQ5c2FU7ytGHCbo-UabBR", 
    "https://drive.google.com/uc?id=1I3q1fp2ShkjL1dJaXdA3VsZWjpNJP9pz", 
    "https://drive.google.com/uc?id=1M_O-zfGcgMaBtligKbPq8AeOVKgt4h-i", 
    "https://drive.google.com/uc?id=1Vtf3r7l8X_bl4X7LukA8-tM_sRLprwuL", 
    "https://drive.google.com/uc?id=1ZUqUdyxKk29B37dgtEddFV-x6XstXdSx", 
    "https://drive.google.com/uc?id=1Z_zCopL0EgAdAiY5bnJbDCCAUvWHuqf-", 
    "https://drive.google.com/uc?id=1dFBIMnpqzkrOdH7ysLjmlJ4uJxZsm1Uh", 
    "https://drive.google.com/uc?id=1dkMiLLunYX5FCZB7WNtd7cLMdzsdqhyH", 
    "https://drive.google.com/uc?id=1hpl9WPgLy4tJRqBuQIkcIHDIbb6gWW8d", 
    "https://drive.google.com/uc?id=1pcsKUQHZYbncnOOFeLYt2oZbOur4RdlL", 
    "https://drive.google.com/uc?id=1q9ISqe6s5-KiNHkIcHP6Ea85vCFp2DXS", 
    "https://drive.google.com/uc?id=1wsgml0jI6brKiMKGT-5rzZjda0b-9GoA"
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
    return Scaffold(
      appBar: AppBar(),
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
            child: Text("About Text"), 
            height: size.height * 0.125, 
            margin: EdgeInsets.only(bottom: 10)
          ),
          Expanded(child: ImagesGridView(allImages: allImages)),
        ],
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




