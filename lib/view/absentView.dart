import 'package:flutter/material.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/place_picker.dart';

class AbsentView extends StatefulWidget {
  @override
  _AbsentViewState createState() => _AbsentViewState();
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
}

class _AbsentViewState extends State<AbsentView> {
  String location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Absent'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: RaisedButton(
                    child: Text('Get Location'),
                    onPressed: () {
                    showPlacePicker();
                  }),
                ),
              )
            ],
          ),
        ));
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker('AIzaSyCJg1lduDXh4NNS03f2URyir6XmgOEVEFI')));
    setState(() {
      location = result.formattedAddress;
    });
  }
}
