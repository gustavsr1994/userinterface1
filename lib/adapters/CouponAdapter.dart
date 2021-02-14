import 'package:clay_containers_plus/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Coupon.dart';

class CouponAdapter extends StatelessWidget {
  Coupon model;
  BuildContext context;

  CouponAdapter({this.context, this.model});
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 90,
        depth: 50,
        surfaceColor: colorNetral,
        customBorderRadius: BorderRadius.all(Radius.circular(20)),
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              model.name,
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Disc : ' + model.disc + '%',
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(color: colorPrimary, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Minimal transaksi ' + model.minPrice,
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(color: colorPrimary, fontSize: 15),
            ),
          ),
        ]));
  }
}
