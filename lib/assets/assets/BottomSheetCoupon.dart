import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/CouponAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Coupon.dart';
import 'package:flutter_maps/providers/discountProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void bottomSheetCoupon(
    {@required BuildContext context,
    @required List<Coupon> listCoupon,
    DiscountProvider provider}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context2) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5),
                  child: Row(children: [
                    Text('Coupon',
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Spacer(),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.times, color: colorRed),
                      onPressed: () {
                        Navigator.pop(context2);
                      },
                    )
                  ])),
              for (int index = 0; index < listCoupon.length; index++)
                CouponAdapter(context: context, model: listCoupon[index], provider: provider),
            ],
          ),
        );
      });
}
