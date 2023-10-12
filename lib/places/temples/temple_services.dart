import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_guide_app/places/temples/temple_model.dart';

class TempleService {
  List<UserTempelsModel> templeData = [];
  Future<List<UserTempelsModel>> getTempleData({
    required BuildContext context,
  }) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/temples.json');
      return userTempelsModelFromJson(jsonString);
    } catch (e) {
      throw e.toString();
    }
  }
}
