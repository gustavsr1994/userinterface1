import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Testing'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(-6.292313, 106.913520), zoom: 14)),
    );
  }
}
