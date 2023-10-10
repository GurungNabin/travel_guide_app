// To parse this JSON data, do
//
//     final userMonasteryModel = userMonasteryModelFromJson(jsonString);

import 'dart:convert';

List<UserMonasteryModel> userMonasteryModelFromJson(String str) => List<UserMonasteryModel>.from(json.decode(str).map((x) => UserMonasteryModel.fromJson(x)));

String userMonasteryModelToJson(List<UserMonasteryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserMonasteryModel {
    final String title;
    final String address;
    final String image;
    final String laditude;
    final String longitude;
    final String description;

    UserMonasteryModel({
        required this.title,
        required this.address,
        required this.image,
        required this.laditude,
        required this.longitude,
        required this.description,
    });

    factory UserMonasteryModel.fromJson(Map<String, dynamic> json) => UserMonasteryModel(
        title: json["title"],
        address: json["address"],
        image: json["image"],
        laditude: json["laditude"],
        longitude: json["longitude"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "address": address,
        "image": image,
        "laditude": laditude,
        "longitude": longitude,
        "description": description,
    };
}
