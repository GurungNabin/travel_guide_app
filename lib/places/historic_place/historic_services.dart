import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_guide_app/places/historic_place/historic_model.dart';

class HistoricPlaceServices {
  Future<List<UserHistoricModel>> getHistoricData({
    required BuildContext context,
  }) async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/historic.json');
      return userHistoricModelFromJson(jsonString);
    } catch (e) {
      throw e.toString();
    }
  }
}
