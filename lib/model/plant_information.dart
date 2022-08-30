// To parse this JSON data, do
//
//     final plantInfoModel = plantInfoModelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';
PlantInfoModel plantInfoModelFromJson(String str, int index) => PlantInfoModel.fromJson(jsonDecode(str)[index]);

String plantInfoModelToJson(PlantInfoModel data) => json.encode(data.toJson());

class PlantInfoModel {
    PlantInfoModel({
        required this.code3NumericDigits,
        required this.plantName,
        required this.sunExposure,
        required this.waterNeeds,
        required this.propagation,
        required this.season,
        required this.lifeCycle,
        required this.usesBenefits,
        required this.flowering,
        required this.type,
        required this.image,
        required this.germsMainAffecting,
    });

    String code3NumericDigits;
    String plantName;
    String sunExposure;
    String waterNeeds;
    String propagation;
    String season;
    String lifeCycle;
    String usesBenefits;
    String flowering;
    String type;
    String image;
    String germsMainAffecting;

    factory PlantInfoModel.fromJson(Map<String, dynamic> json) => PlantInfoModel(
        code3NumericDigits: json["Code (3 Numeric Digits):"],
        plantName: json["Plant Name:"],
        sunExposure: json["Sun Exposure:"],
        waterNeeds: json["Water Needs"],
        propagation: json["Propagation:"],
        season: json["Season:"],
        lifeCycle: json["Life Cycle:"],
        usesBenefits: json["Uses/benefits:"],
        flowering: json["Flowering:"],
        type: json["Type:"],
        image: json["Image"],
        germsMainAffecting: json["Germs (main affecting)"],
    );

    Map<String, dynamic> toJson() => {
        "Code (3 Numeric Digits):": code3NumericDigits,
        "Plant Name:": plantName,
        "Sun Exposure:": sunExposure,
        "Water Needs": waterNeeds,
        "Propagation:": propagation,
        "Season:": season,
        "Life Cycle:": lifeCycle,
        "Uses/benefits:": usesBenefits,
        "Flowering:": flowering,
        "Type:": type,
        "Image": image,
        "Germs (main affecting)": germsMainAffecting,
    };
}
