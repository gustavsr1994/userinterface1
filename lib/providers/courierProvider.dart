import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourierProvider with ChangeNotifier {
  CourierProvider();
  String idCourier = '0';
  String nameCourier = 'Pilih Kurir';
  IconData icon = FontAwesomeIcons.angleDown;

  void getCourier({@required String id, @required String name}) {
    icon = FontAwesomeIcons.times;
    idCourier = id.toString();
    nameCourier = name.toString();
    notifyListeners();
  }

  void deleteCourier() {
    icon = FontAwesomeIcons.angleDown;
    nameCourier = 'Pilih Kurir';
    notifyListeners();
  }
}
