import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/CartAdapter.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/providers/cartProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void bottomSheetCart(
    {@required BuildContext context,
    @required List<Cart> listCart,
    @required CartProvider provider,
    @required int totalAmount}) {
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
                    Text('Keranjang',
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
              for (int index = 0; index < listCart.length; index++)
                CartAdapter(
                    context: context,
                    model: listCart[index],
                    provider: provider),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(15),
                  child: Row(children: [
                    Text('Total',
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Spacer(),
                    Text(totalAmount.toString(),
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right),
                  ])),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                      color: colorPrimary,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        child: Text('Detail Transaksi', style: fontButton),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: colorPrimary, style: BorderStyle.solid)),
                      onPressed: () {
                        // RouteAdapter().routeNavigator(
                        //     context,
                        //     );
                      })),
            ],
          ),
        );
      });
}
