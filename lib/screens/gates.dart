import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class GatesScreen extends StatefulWidget {
  const GatesScreen({Key? key}) : super(key: key);

  @override
  State<GatesScreen> createState() => _GatesScreenState();
}

class _GatesScreenState extends State<GatesScreen> {
  bool isLoading = true;
  List<String> imageUrls = [
    // 'https://drive.google.com/uc?id=16SToMgqFqPen737R0s5qJTPpWUGDa8B4',
    "https://drive.google.com/uc?id=11zhlGl23vo1tZikjJBihkEvqgfCDEBmy", 
    "https://drive.google.com/uc?id=1K1ckzgHJJ6IMk0SinMvL-LSKjB8u3sMp", 
    "https://drive.google.com/uc?id=1QqvPviiEd4Z9pFr3DHAsLVAEPf9slYD2", 
    "https://drive.google.com/uc?id=1UjA1aYwn8Nf9-pr4Lbxc7SSHm6KNISV3", 
    "https://drive.google.com/uc?id=1ccvO97i8HJY8YEXGIsGj5cbUNMVbvcpZ", 
    "https://drive.google.com/uc?id=1pOrngHVlQpM0WFN8YvDkIlIEPMFNdkbZ", 
    "https://drive.google.com/uc?id=1qH46fFcBSv5s6HDPoG-DGv-vTR8lb9GL"
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




