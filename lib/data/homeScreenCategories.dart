import 'package:park_with_conscience/model/home_screen_categories.dart';
import 'package:park_with_conscience/screens/compostPitScreen.dart';
import 'package:park_with_conscience/screens/drainage.dart'; 
import 'package:park_with_conscience/screens/freeNurseryScreen.dart';
import 'package:park_with_conscience/screens/gates.dart';
import 'package:park_with_conscience/screens/solarLightsScreen.dart';
import 'package:park_with_conscience/screens/sprinklersScreen.dart'; 
List<Details> categories = [ 
  Details( 
    name: "Smart Solar Lights", 
    imageAddress: "assets/images/solarLights.gif", 
    screenName: SolarLightsScreen() 
  ), 
  Details( 
    name: "Sprinklers", 
    imageAddress: "assets/images/sprinklers.png", 
    screenName: SprinklerScreen() 
  ), 
  Details( 
    name: "Free Nursery", 
    imageAddress: "assets/images/nursery.heic", 
    screenName: NurseryScreen() 
  ), 
  Details( 
    name: "Entry Gates", 
    imageAddress: "assets/images/gate.jpeg", 
    screenName: GatesScreen() 
  ), 
  Details( 
    name: "Drainage", 
    imageAddress: "assets/images/drainage.jpeg", 
    screenName: DrainageScreen() 
  ), 
  Details( 
    name: "Compost pit", 
    imageAddress: "assets/images/compostPit.jpeg", 
    screenName: CompostPitScreen() 
  ), 
  
];