// To parse this JSON data, do
//
//     final allPlacesModel = allPlacesModelFromJson(jsonString);

import 'dart:convert';

List<AllPlacesModel> allPlacesModelFromJson(String str) =>
    List<AllPlacesModel>.from(
        json.decode(str).map((x) => AllPlacesModel.fromJson(x)));

String allPlacesModelToJson(List<AllPlacesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPlacesModel {
  final int id;
  final String name;
  final String address;
  final String latitude;
  final String longitude;
  final String description;
  final String image;

  AllPlacesModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.image,
  });

  factory AllPlacesModel.fromJson(Map<String, dynamic> json) => AllPlacesModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "image": image,
      };
}
