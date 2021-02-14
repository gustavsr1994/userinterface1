import 'package:clay_containers_plus/clay_containers.dart';
import 'package:clay_containers_plus/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/providers/cartProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartAdapter extends StatelessWidget {
  Cart model;
  BuildContext context;
  CartProvider provider;
  CartAdapter({this.context, this.model, this.provider});
  @override
  Widget build(BuildContext context) {
    // CartProvider provider = Provider.of<CartProvider>(context);
    // ScreenUtil.init(context,
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     allowFontScaling: true);

    return ClayContainer(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(10),
        height: 130,
        depth: 50,
        surfaceColor: colorNetral,
        customBorderRadius: BorderRadius.all(Radius.circular(20)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      model.nameProduct,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Text("Harga : "),
                  Spacer(),
                  Text(
                    model.qty.toString() + ' x Rp ' + model.price.toString(),
                    // FlutterMoneyFormatter(amount: cart.price.toDouble())
                    //     .output
                    //     .nonSymbol,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Text("Total : "),
                  Spacer(),
                  Text(
                    (model.qty * model.price).toString(),
                    // FlutterMoneyFormatter(amount: cart.price.toDouble())
                    //     .output
                    //     .nonSymbol,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ])));
  }
}
