import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';


class GalleryScreen extends StatefulWidget {
  
  final List<String> imageUrls;
  
  const GalleryScreen({Key? key, required this.imageUrls}) : super(key: key);


  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}
class _GalleryScreenState extends State<GalleryScreen> {
  bool isLoading = true;
  List<Image> allImages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImages();
    
  }
  Future loadImages() async {
    Image _image = Image(image: AssetImage("assets/images/solarLights.jpeg"));
    allImages.add(_image);
    for(String url in widget.imageUrls) {
      _image = Image.network(url.toString(), fit: BoxFit.cover,);
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
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
  ),
      ),
      body: isLoading 
      ? AnimationGridView(isLoading: isLoading) 
      : ImagesGridView(allImages: allImages),
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
        return allImages[index+1];
      }
    ), 
      staggeredTileBuilder: (index) => StaggeredTile.count(
         (index % 4 == 0) ? 2 : 1, (index % 4 == 0) ? 2 : 1
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
    );
  }
}