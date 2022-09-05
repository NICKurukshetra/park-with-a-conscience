import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class SolarLightsScreen extends StatelessWidget {
  const SolarLightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Solar Lights"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
          
        ),
        body: Column(
          children: [
            Container(
              height: size.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/solarLights.gif"),
                  fit: BoxFit.cover
                  )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green.withOpacity(.6),
                    Colors.white.withOpacity(.6),
                 ]),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  """\u2022 Solar powered outdoor light \n
\u2022 270 degree spread \n
\u2022 120 degree wide angle sensor \n
\u2022 15 second timeout after person leaves \n
\u2022 Automatic Lighting - Light activates only when sensing motion at night.\n
\u2022 This acts as a security light \n
\u2022 No electricity required \n
\u2022 No Wire Needed \n
\u2022 The light lasts for 8-10 hours if fully charged \n
\u2022 1800 watt battery.""",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,

                  )
                ), 
                height: size.height * 0.4, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}



