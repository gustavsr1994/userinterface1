import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_maps/models/Courier.dart';

class CourierRepository{
  
  static Future<ResultCourier> listCourier() async {
    String result = "";
    try {
      result = await rootBundle.loadString("lib/assets/files/courier.json");
    } on HttpException catch (_) {
      throw "No Connection. Please connect to Internet.";
    }
    var jsonObject = json.decode(result);
    var data = jsonObject as Map<String, dynamic>;
    return ResultCourier.fromJson(data);
  }
}