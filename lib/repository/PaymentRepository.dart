import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_maps/models/PaymentModel.dart';

class PaymentRepository {

    static Future<PaymentModel> listPayment() async {
    String result = "";
    try {
      result = await rootBundle.loadString("lib/assets/files/payment.json");
    } on HttpException catch (_) {
      throw "No Connection. Please connect to Internet.";
    }
    var jsonObject = json.decode(result);
    var data = jsonObject as Map<String, dynamic>;
    return PaymentModel.fromJson(data);
  }
}