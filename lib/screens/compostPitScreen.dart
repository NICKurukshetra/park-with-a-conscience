import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class CompostPitScreen extends StatefulWidget {
  const CompostPitScreen({Key? key}) : super(key: key);

  @override
  State<CompostPitScreen> createState() => _CompostPitScreenState();
}

class _CompostPitScreenState extends State<CompostPitScreen> {
  bool isLoading = true;
  List<String> imageUrls = [
    "https://drive.google.com/uc?id=12Ze9KWBm5N5gQAepgJQ6t5eRoEKYQbV0", 
    "https://drive.google.com/uc?id=13B-3XTEMJelancxsIm_nuqceJax0nbXh", 
    "https://drive.google.com/uc?id=1F_cVnouLmD1dcZI0rOMPPsPLb0INBcdb", 
    "https://drive.google.com/uc?id=1I3O0GfjAWFCiXruo8HN-VdJYukNOrTFr", 
    "https://drive.google.com/uc?id=1J1OK-XuuicvPGfLj00SYIsRMKEoKyszv", 
    "https://drive.google.com/uc?id=1L56B3a1c8mjIhaGzdXjhxPSwNbQCOmjV", 
    "https://drive.google.com/uc?id=1MA8DtdJi_NQMILm84QcTvBf40Q3bMNTo", 
    "https://drive.google.com/uc?id=1OeTdPUw331O2LIYXi44eaIGxMVtpcwUn", 
    "https://drive.google.com/uc?id=1R1ZG7oR0K1RRVDm2iKefx585CC454X4D", 
    "https://drive.google.com/uc?id=1iJTxrr3WniCehc93ppKoUI63qPS3aRZt", 
    "https://drive.google.com/uc?id=1jOilNYzslmzWLL7thYnhQk5VJw3Dirkt"
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
            child: Text(
              "methods of composting organic material for the garden, Once the pit is filled with enough compostable material. Compost pit requires three things - Oxygen, Sunlight and waste. People provide waste from their homes, The pit is made in such a place where sunlight is sufficiently present, and the pit has big holes on sides to provide oxygen."
            ), 
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




