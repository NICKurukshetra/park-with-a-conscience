// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';

List<Plant> plantFromJson(String str) => List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
    Plant({
        required this.srno,
        required this.code,
        required this.plantName,
        required this.sunExposure,
        required this.waterNeeds,
        required this.propagation,
        required this.season,
        required this.lifeCycle,
        required this.uses,
        required this.flowering,
        required this.type,
        required this.image,
        required this.germs,
        required this.about,
    });

    int srno;
    String code;
    String plantName;
    String sunExposure;
    String waterNeeds;
    String propagation;
    String season;
    String lifeCycle;
    String uses;
    String flowering;
    String type;
    String image;
    String germs;
    String about;

    factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        srno: json["srno"],
        code: json["code"],
        plantName: json["plant_Name"],
        sunExposure: json["sun_Exposure"],
        waterNeeds: json["water_Needs"],
        propagation: json["propagation"],
        season: json["season"],
        lifeCycle: json["life_Cycle"],
        uses: json["uses"],
        flowering: json["flowering"],
        type: json["type"],
        image: json["image"],
        germs: json["germs"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "srno": srno,
        "code": code,
        "plant_Name": plantName,
        "sun_Exposure": sunExposure,
        "water_Needs": waterNeeds,
        "propagation": propagation,
        "season": season,
        "life_Cycle": lifeCycle,
        "uses": uses,
        "flowering": flowering,
        "type": type,
        "image": image,
        "germs": germs,
        "about": about,
    };
}