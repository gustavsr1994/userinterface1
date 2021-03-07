import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/CourierAdapter.dart';
import 'package:flutter_maps/models/Courier.dart';
import 'package:flutter_maps/providers/courierProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';

void bottomSheetCourier(
    {@required BuildContext context,
    @required List<Courier> listCourier,
    CourierProvider provider}) {
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
                    Text('Courier',
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
              for (int index = 0; index < listCourier.length; index++)
                CourierAdapter(
                    context: context,
                    model: listCourier[index],
                    provider: provider),
            ],
          ),
        );
      });
}
