import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/listPayment.dart';
import 'package:flutter_maps/view/mainMenuView.dart';

class DetailPaymentView extends StatefulWidget {
  @override
  _DetailPaymentViewState createState() => _DetailPaymentViewState();
  String namePayment;
  DetailPaymentView({this.namePayment});
}

class _DetailPaymentViewState extends State<DetailPaymentView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return RouteAdapter().routeNavigator(context, ListPayment());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          centerTitle: true,
          title: Text(
            'Detail Payment',
            style: fontTitle,
          ),
          leading: BackButton(
            color: colorAccentPrimary,
            onPressed: () {
              RouteAdapter().routeNavigator(context, ListPayment());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(widget.namePayment, style: fontEditText)),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('085697355988', style: textError),
                    FlatButton(
                        onPressed: null,
                        child: Text('Copy', style: fontDescription))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              RaisedButton(
                  child: Text('Check Transaction', style: fontButton),
                  color: colorPrimary,
                  onPressed: () {
                    RouteAdapter()
                        .routeNavigator(context, MainMenuView(index: 1));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
