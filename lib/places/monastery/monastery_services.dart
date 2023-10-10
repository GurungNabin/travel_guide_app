import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_guide_app/places/monastery/monastery_model.dart';

class MonasteryServices {
  Future<List<UserMonasteryModel>> getMonasteryData({
    required BuildContext context,
  }) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/monastery.json');
      return userMonasteryModelFromJson(jsonString);
    } catch (e) {
      throw e.toString();
    }
  }
}
