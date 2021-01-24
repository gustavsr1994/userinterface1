import 'package:flutter_maps/assets/style.dart';
import 'package:flutter/material.dart';

class ConditionNull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'No Data',
            style: textError,
          ),
          Text(
            'Swipe down for refresh item',
            style: textError,
          )
        ],
      ),
    );
  }
}
