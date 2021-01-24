import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';

void bottomSheetDescription(
    {@required BuildContext context, @required String description}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context2) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text('Detail Barang',
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(5),
                child: Text(description,
                    style: TextStyle(color: colorPrimary, fontSize: 20),
                    textAlign: TextAlign.justify),
              ),
            ],
          ),
        );
      });
}
