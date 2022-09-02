import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class SprinklerScreen extends StatefulWidget {
  const SprinklerScreen({Key? key}) : super(key: key);

  @override
  State<SprinklerScreen> createState() => _SprinklerScreenState();
}

class _SprinklerScreenState extends State<SprinklerScreen> {
  bool isLoading = true;
  List<String> imageUrls = [
    
    "https://drive.google.com/uc?id=1-NZVuQ1M1ojDKuybjl-cC0cLQxhpTU0_", 
    "https://drive.google.com/uc?id=10wuAGbkpu313I2s1AXtr8mVTlwPigql_", 
    "https://drive.google.com/uc?id=125Mr-MqOQLBth4pprE-QPieQU1BJjZpK", 
    "https://drive.google.com/uc?id=12EkHsN1xTil06hUkHrI-Uhdov6LNzwt-", 
    "https://drive.google.com/uc?id=15Z6q_dK5F1RcsFd0t8EHfC1FcqWQ311k", 
    "https://drive.google.com/uc?id=17sD_sCz5KrQ827r18bfxPATv9eaQk3d_", 
    "https://drive.google.com/uc?id=18CGLcucjPdvO3J7tLbkF1u5rI7K4urkW", 
    "https://drive.google.com/uc?id=19kNMIPeFKMY1cvd9TvSWEzVRYOLDJsgI", 
    "https://drive.google.com/uc?id=1FO5zSWFKs_ia9C2tFa-y3988wnxi6CGu", 
    "https://drive.google.com/uc?id=1I7ekrbmx6b1g17F1O55AHsQX2hYbr7mJ", 
    "https://drive.google.com/uc?id=1JE8u7QFk7LOY6LwB9xsvwFdSB-C4tGjn", 
    "https://drive.google.com/uc?id=1J_fmOP0Q_DrslGU3pIwk_EwmCXUvz1iT", 
    "https://drive.google.com/uc?id=1K4Ex0YzoANbNHNWAq0yfZXHmyLSMglJT", 
    "https://drive.google.com/uc?id=1MFtZ__Cui18DUik_4-4a_iLvJ1X2LdjX", 
    "https://drive.google.com/uc?id=1MmWSZGkivKEBsEeot_PtpWTiLKt95Dbq", 
    "https://drive.google.com/uc?id=1N34Gwlf-01lXnGOKw2P7QMjY4iSaftmA", 
    "https://drive.google.com/uc?id=1QDlqXKG8yFgl_Ip0We99__F-6rOByEX9", 
    "https://drive.google.com/uc?id=1SVh9uWqQxSOKq56phvY4aUTOU2G2MASQ", 
    "https://drive.google.com/uc?id=1Sk1dKKF7EyYlNrSBZHfkSa2czmDMsaZ-", 
    "https://drive.google.com/uc?id=1WWlBa3VzC8sqpybtWoBpRRi44-_FaQsR", 
    "https://drive.google.com/uc?id=1_MG0uiams4G1y4M_yQxt6eUlVAHHmUf3", 
    "https://drive.google.com/uc?id=1e8W4IZO_lzp-VsPMLIuvzcUXAUFZEr5f", 
    "https://drive.google.com/uc?id=1fRDkRZrND-3TFbqidC5DQVlVqk2u_Tea", 
    "https://drive.google.com/uc?id=1im8B2nweG386k033g_UkHL_VgoXw6hBh", 
    "https://drive.google.com/uc?id=1kyHH590KQ2aGzNwpXl0p-r4AkAnF7ACH", 
    "https://drive.google.com/uc?id=1mPVQnYKnxKCEd37kbRWYraa6PfS037A8", 
    "https://drive.google.com/uc?id=1oo3yUCARg7BacBkoncYGDdYqktzd3GM0", 
    "https://drive.google.com/uc?id=1oq8E-ds_fel0sNcfMOYjpQUEBKEO04Gb", 
    "https://drive.google.com/uc?id=1q9AucKiLJ4G8NK_JM_nCTES7S0PCZoxn", 
    "https://drive.google.com/uc?id=1rGN4-Uu0TOHPb7nj0pQSubtu5b4XH8PL", 
    "https://drive.google.com/uc?id=1rir0FlURfU4Hqj90fcasEYyqPeM2YSER", 
    "https://drive.google.com/uc?id=1tq9uAwk4vZud5tlyuPVHw0FFCx_1Bf-P", 
    "https://drive.google.com/uc?id=1tto3_y8tsXI3zyj1YLzVztmvYZ3Qb1Wp", 
    "https://drive.google.com/uc?id=1yDbhmRB93EyX5JvSWtoY9i-73VtHZ-E4"
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
      _image = Image.network(url.toString(),fit: BoxFit.cover);
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
            child: Text(
              "High pressure , anti-aging , high temperature resistance . Not easily deformed , reliable opening and long service life . Not only greatly save the cost of sporaying but also has pretty quality . Made in ​Engering material . 90/180/360 Degree spray for you choose.90 Degree Spray Blue Nozzle Working pressure : 150kPa~300kPa Flow Rate : 20~30 L/H Radius Range : 1~1.5 meter"
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
          color: Colors.amber,

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




