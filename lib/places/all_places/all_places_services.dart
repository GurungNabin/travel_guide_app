import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_guide_app/places/all_places/all_places_model.dart';

class AllPlacesServices {
  Future<List<AllPlacesModel>> getPlacesData({
    required BuildContext context,
  }) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/all_places.json');
      print(jsonString);
      return allPlacesModelFromJson(jsonString);
    } catch (e) {
      throw e.toString();
    }
  }
}
