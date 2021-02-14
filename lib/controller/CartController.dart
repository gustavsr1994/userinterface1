import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  int qty;
  String totalAmount;
  String product;

  addQty({@required int amount, int itemQty, String codeProduct}) {
    qty = itemQty + 1;
    int total = qty * amount;
    totalAmount = total.toString();
    product = codeProduct;
  }

  minusQty({@required int amount, int itemQty, String codeProduct}) {
    if (itemQty > 0) {
      qty = itemQty - 1;
    }
    int total = qty * amount;
    totalAmount = total.toString();
    product = codeProduct;
  }
}