import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/aboutUs.dart';
import 'package:flutter_maps/view/mainMenuView.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  @override
  _MapsViewState createState() => _MapsViewState();
  String nameCorp;
  String industry;
  String coordinate;
  MapsView({@required this.nameCorp, this.industry, @required this.coordinate});
}

class _MapsViewState extends State<MapsView> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _center;
  Set<Marker> _marker = {};
  LatLng _lastMapPosition;
  MapType _currentMapType = MapType.normal;
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  void initState() {
    super.initState();
    List<String> detailCoordinate = widget.coordinate.split(',');
    _center = LatLng(
        double.parse(detailCoordinate[0]), double.parse(detailCoordinate[1]));
    _lastMapPosition = _center;
    _marker.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: LatLng(double.parse(detailCoordinate[0]),
            double.parse(detailCoordinate[1])),
        infoWindow:
            InfoWindow(title: widget.nameCorp, snippet: widget.industry),
        icon: BitmapDescriptor.defaultMarker));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: BackButton(
          color: colorAccentPrimary,
          onPressed: onBackPress,
        ),
        title: Text(widget.nameCorp, style: fontTitle),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 12),
        mapType: _currentMapType,
        markers: _marker,
        onCameraMove: _onCameraMove,
      ),
    );
  }

  Future<bool> onBackPress() {
    return RouteAdapter().routeNavigator(context, MainMenuView());
  }
}
