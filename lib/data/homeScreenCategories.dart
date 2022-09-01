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
    imageAddress: "assets/images/solarLights.png", 
    screenName: SolarLightsScreen() 
  ), 
  Details( 
    name: "Sprinklers", 
    imageAddress: "assets/images/sprinklers.png", 
    screenName: SprinklerScreen() 
  ), 
  Details( 
    name: "Free Nurrery", 
    imageAddress: "assets/images/day:night SolarLights.png", 
    screenName: NurseryScreen() 
  ), 
  Details( 
    name: "Entry Gates", 
    imageAddress: "assets/images/day:night SolarLights.png", 
    screenName: GatesScreen() 
  ), 
  Details( 
    name: "Drainage", 
    imageAddress: "assets/images/day:night SolarLights.png", 
    screenName: DrainageScreen() 
  ), 
  Details( 
    name: "Compost pit", 
    imageAddress: "assets/images/day:night SolarLights.png", 
    screenName: CompostPitScreen() 
  ), 
  
];