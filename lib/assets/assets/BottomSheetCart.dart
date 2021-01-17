import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/CartAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/providers/cartProvider.dart';

void bottomSheetCart(
    {@required BuildContext context,
    @required List<Cart> listCart,
    @required CartProvider provider}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(5),
                child: Text('Keranjang',
                    style: TextStyle(
                        color: colorPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              for (int index = 0; index < listCart.length; index++)
                CartAdapter(
                    context: context,
                    model: listCart[index],
                    provider: provider)
            ],
          ),
        );
      });
}
