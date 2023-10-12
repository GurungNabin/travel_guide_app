// To parse this JSON data, do
//
//     final userMonasteryModel = userMonasteryModelFromJson(jsonString);

import 'dart:convert';

List<UserMonasteryModel> userMonasteryModelFromJson(String str) => List<UserMonasteryModel>.from(json.decode(str).map((x) => UserMonasteryModel.fromJson(x)));

String userMonasteryModelToJson(List<UserMonasteryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserMonasteryModel {
    final String name;
    final String address;
    final String image;
    final String latitude;
    final String longitude;
    final String description;

    UserMonasteryModel({
        required this.name,
        required this.address,
        required this.image,
        required this.latitude,
        required this.longitude,
        required this.description,
    });

    factory UserMonasteryModel.fromJson(Map<String, dynamic> json) => UserMonasteryModel(
        name: json["name"],
        address: json["address"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "image": image,
        "laditude": latitude,
        "longitude": longitude,
        "description": description,
    };
}
