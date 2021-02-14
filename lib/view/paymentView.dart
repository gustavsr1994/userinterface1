import 'dart:html';

import 'package:clay_containers_plus/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/constant.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/detailTransaction.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          centerTitle: true,
          title: Text(
            'Payment Methode',
            style: fontTitle,
          ),
          leading: BackButton(
            onPressed: onBackPress,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int index = 0; index < listPayment.length; index++)
                GestureDetector(
                  child: ClayContainer(
                    child: Text(listPayment[index]),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPress() {
    return RouteAdapter().routeNavigator(context, DetailTransaction());
  }
}
