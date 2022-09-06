// To parse this JSON data, do
//
//     final plantInfoModel = plantInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlantInfoModel plantInfoModelFromJson(String str, int index) => PlantInfoModel.fromJson(json.decode(str)[index]);

String plantInfoModelToJson(PlantInfoModel data) => json.encode(data.toJson());

class PlantInfoModel {
    PlantInfoModel({
        required this.code,
        required this.plantName,
        required this.sunExposure,
        required this.waterNeeds,
        required this.propagation,
        required this.season,
        required this.lifeCycle,
        required this.usesBenefits,
        required this.flowering,
        required this.type,
        required this.size,
        required this.image,
        required this.about,
    });

    String code;
    String plantName;
    String sunExposure;
    String waterNeeds;
    String propagation;
    String season;
    String lifeCycle;
    String usesBenefits;
    String flowering;
    String type;
    String size;
    String image;
    String about;

    factory PlantInfoModel.fromJson(Map<String, dynamic> json) => PlantInfoModel(
        code: json["Code"],
        plantName: json["Plant Name:"],
        sunExposure: json["Sun Exposure:"],
        waterNeeds: json["Water Needs"],
        propagation: json["Propagation:"],
        season: json["Season:"],
        lifeCycle: json["Life Cycle:"],
        usesBenefits: json["Uses/benefits:"],
        flowering: json["Flowering:"],
        type: json["Type:"],
        size: json["Size"],
        image: json["Image"],
        about: json["About"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Plant Name:": plantName,
        "Sun Exposure:": sunExposure,
        "Water Needs": waterNeeds,
        "Propagation:": propagation,
        "Season:": season,
        "Life Cycle:": lifeCycle,
        "Uses/benefits:": usesBenefits,
        "Flowering:": flowering,
        "Type:": type,
        "Size": size,
        "Image": image,
        "About": about,
    };
}
