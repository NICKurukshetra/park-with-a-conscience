import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NurseryScreen extends StatelessWidget {
  const NurseryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3, 
        itemCount: 20,
        itemBuilder: ((context, index) {
          return Container(color: Colors.amber, height: size.height*0.2, margin: EdgeInsets.all(10),);
        }), 
        staggeredTileBuilder: (index) => StaggeredTile.count(
           (index % 4 == 0) ? 2 : 1, (index % 4 == 0) ? 2 : 1
        ),

      ),
    );
  }
}





/*
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