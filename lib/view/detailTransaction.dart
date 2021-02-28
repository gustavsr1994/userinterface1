import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_maps/adapters/CartAdapter.dart';
import 'package:flutter_maps/assets/assets/BottomSheetCoupon.dart';
import 'package:flutter_maps/assets/assets/BottomSheetCourier.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/models/Coupon.dart';
import 'package:flutter_maps/models/Courier.dart';
import 'package:flutter_maps/repository/CouponRepository.dart';
import 'package:flutter_maps/repository/CourierRepository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailTransaction extends StatefulWidget {
  @override
  _DetailTransactionState createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  List<Cart> listCart;
  List<Coupon> listCoupon;
  List<Courier> listCourier;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController discountController = TextEditingController();
  int totalAmount = 0;
  @override
  void initState() {
    super.initState();
    getListCart();
    CouponRepository.listCoupon().then((value) {
      setState(() {
        listCoupon = value.coupon;
      });
    });
    CourierRepository.listCourier().then((value) {
      setState(() {
        listCourier = value.courier;
      });
    });
  }

  void getListCart() async {
    SharedPreferences.getInstance().then((value) {
      listCart = new List<Cart>();
      String cart = value.getString('cart');
      dynamic objResult = jsonDecode(cart);
      setState(() {
        for (var result in objResult) {
          Cart cartModel = new Cart();
          cartModel = Cart.fromJson(result as Map<String, dynamic>);
          totalAmount = cartModel.subTotal + totalAmount;
          listCart.add(cartModel);
        }
      });
      refreshController.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        centerTitle: true,
        title: Text(
          'My Transaction',
          style: fontTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: SmartRefresher(
                  controller: refreshController,
                  onRefresh: getListCart,
                  child: listCart == null
                      ? Center(
                          child: Text(
                            'No Data',
                            style: fontTitle,
                          ),
                        )
                      : ListView(
                          children: [
                            for (int index = 0;
                                index < listCart.length;
                                index++)
                              CartAdapter(
                                  context: context, model: listCart[index])
                          ],
                        )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: colorPrimary),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextField(
                controller: discountController,
                style: fontEditText,
                onTap: () {
                  bottomSheetCoupon(context: context, listCoupon: listCoupon);
                },
                decoration: InputDecoration(
                  labelStyle: fontEditText,
                  icon: Icon(
                    FontAwesomeIcons.percentage,
                    color: colorPrimary,
                  ),
                  labelText: 'Discount',
                  hintText: 'Masukkan Discount',
                )),
          ),
          GestureDetector(
            onTap: () {
              bottomSheetCourier(context: context, listCourier: listCourier);
            },
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: colorPrimary),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    Text('Pilih Kurir',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(FontAwesomeIcons.angleDown)
                  ],
                )),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //       margin: EdgeInsets.all(10),
          //       padding: EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //           border: Border.all(color: colorPrimary),
          //           borderRadius: BorderRadius.all(Radius.circular(15))),
          //       child: Row(
          //         children: [
          //           Text('Pilih Pembayaran',
          //               style: TextStyle(fontWeight: FontWeight.bold)),
          //           Spacer(),
          //           Icon(FontAwesomeIcons.angleDown)
          //         ],
          //       )),
          // ),
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
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              color: colorPrimary,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Pilih Pembayaran', style: fontButton)),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
