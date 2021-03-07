import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscountProvider with ChangeNotifier {
  DiscountProvider();
  String idCoupon = '0';
  String nameCoupon = 'Pilih Kupon';
  IconData icon = FontAwesomeIcons.angleDown;

  void getDiscount({@required String id, @required String name}) {
    icon = FontAwesomeIcons.times;
    idCoupon = idCoupon.toString();
    nameCoupon = name.toString();
    notifyListeners();
  }

  void deleteDiscount() {
    icon = FontAwesomeIcons.angleDown;
    nameCoupon = 'Pilih Kupon';
    notifyListeners();
  }
}
