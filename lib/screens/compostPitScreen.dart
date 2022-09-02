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
    "https://drive.google.com/uc?id=10uKmuCaRPC9odfJFMuufLwW2IttCNevQ", 
    "https://drive.google.com/uc?id=1BbGCVZDt_qQUCBE-uO6zkfvsB8PGmft6", 
    "https://drive.google.com/uc?id=1iALWE5y7qCcOyKHPh5ga8nSH9m8N7MfB",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",
    "https://cdn.s3waas.gov.in/s3248e844336797ec98478f85e7626de4a/uploads/2022/01/2022011919.jpg",

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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Solar Lights"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey,
          
        ),
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
        : SingleChildScrollView(
          child: Column(
            children: [
              // Container(height: size.height * 0.2, color: Colors.black,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.green.withOpacity(.6),
                Colors.white.withOpacity(.6),
                // Colors.green.withOpacity(.4),
                // Color.fromARGB(255, 235, 217, 162).withOpacity(.3),
              ]
                ),),
                //color: Colors.white,
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Solar powered outdoor light,\nAutomatic Lighting - Light activates only when sensing motion at night.\nThis acts as a security light\nNo electricity required,\nNo Wire Needed,\nThe light lasts for 8-10 hours if fully charged",
                  style: Theme.of(context).textTheme.bodySmall!
                  .copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18
                  )
                ), 
                height: size.height * 0.2, 
                // margin: EdgeInsets.only(bottom: 10)
              ),
              ImagesGridView(allImages: allImages),
            ],
          ),
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
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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




