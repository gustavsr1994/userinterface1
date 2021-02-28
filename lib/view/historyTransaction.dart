import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/TextChildCart.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/DataOrder.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

class HistoryTransaction {
  Widget bodyHistory(BuildContext context, DataOrder dataModel) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: colorNetral,
      child: Column(children: [
        GFAccordion(
            collapsedTitleBackgroundColor: colorAccentPrimary,
            expandedTitleBackgroundColor: colorAccentSecond,
            title: 'Order : ' + dataModel.idOrder,
            textStyle: fontDescription,
            collapsedIcon: Text('View Detail', style: fontCollapse),
            expandedIcon: Text('Hide', style: fontCollapse),
            contentChild: Column(children: <Widget>[
              for (int index = 0; index < dataModel.history.length; index++)
                cardDetailOrder(dataModel.history[index])
            ])),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Order Date : ' +
              DateFormat("yyyy-MMM-dd")
                  .format(DateTime.parse(dataModel.dateRequest))),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Payment Date : ' +
              DateFormat("yyyy-MMM-dd")
                  .format(DateTime.parse(dataModel.datePayment))),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Delivery Date : ' +
              DateFormat("yyyy-MMM-dd")
                  .format(DateTime.parse(dataModel.dateDelivery))),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Complete Date : ' +
              DateFormat("yyyy-MMM-dd")
                  .format(DateTime.parse(dataModel.dateComplete))),
        ),
      ]),
    ));
  }

  Widget cardDetailOrder(History model) {
    return Card(
      child: Column(
        children: [
          TextChildProfile(title: model.nameProduct, value: ''),
          TextChildProfile(
              title: model.qty + ' x ' + model.price, value: model.total)
        ],
      ),
    );
  }
}
