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
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        // title: Text("Swipe ->"),
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
  ),
      ),
      // body: isLoading 
      // ? AnimationGridView(isLoading: isLoading) 
      // : ImagesGridView(allImages: allImages),
      body: isLoading 
      ? Shimmer.fromColors(
          child: Container(color:Colors.black), 
          baseColor: Color.fromARGB(149, 158, 158, 158), 
          enabled: isLoading,
          highlightColor: Colors.grey
        )
      : ListView.builder(
        itemCount: allImages.length - 1,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            panEnabled: false,
            minScale: 1,
            maxScale: 4, 
            child: Container(
              // color: Colors.amber, 
              // width: size.width, 
              margin: EdgeInsets.all(5),
              child: allImages[index + 1]
            ),
          );
        } ,
      )
    );
  }
}
