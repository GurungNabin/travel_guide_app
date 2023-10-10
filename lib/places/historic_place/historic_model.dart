// To parse this JSON data, do
//
//     final userHistoricModel = userHistoricModelFromJson(jsonString);

import 'dart:convert';

List<UserHistoricModel> userHistoricModelFromJson(String str) => List<UserHistoricModel>.from(json.decode(str).map((x) => UserHistoricModel.fromJson(x)));

String userHistoricModelToJson(List<UserHistoricModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserHistoricModel {
    final int id;
    final String name;
    final String address;
    final String laditude;
    final String longitude;
    final String title;
    final String description;
    final String image;

    UserHistoricModel({
        required this.id,
        required this.name,
        required this.address,
        required this.laditude,
        required this.longitude,
        required this.title,
        required this.description,
        required this.image,
    });

    factory UserHistoricModel.fromJson(Map<String, dynamic> json) => UserHistoricModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        laditude: json["laditude"],
        longitude: json["longitude"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "laditude": laditude,
        "longitude": longitude,
        "title": title,
        "description": description,
        "image": image,
    };
}
