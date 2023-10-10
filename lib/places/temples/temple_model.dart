// To parse this JSON data, do
//
//     final userTempelsModel = userTempelsModelFromJson(jsonString);

import 'dart:convert';

List<UserTempelsModel> userTempelsModelFromJson(String str) => List<UserTempelsModel>.from(json.decode(str).map((x) => UserTempelsModel.fromJson(x)));

String userTempelsModelToJson(List<UserTempelsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserTempelsModel {
    final int id;
    final String name;
    final String address;
    final String laditude;
    final String longitude;
    final String description;
    final String image;

    UserTempelsModel({
        required this.id,
        required this.name,
        required this.address,
        required this.laditude,
        required this.longitude,
        required this.description,
        required this.image,
    });

    factory UserTempelsModel.fromJson(Map<String, dynamic> json) => UserTempelsModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        laditude: json["laditude"],
        longitude: json["longitude"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "laditude": laditude,
        "longitude": longitude,
        "description": description,
        "image": image,
    };
}
