import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Mapa(),
    );
  }
}

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _center = const LatLng(-0.175924, -78.487347);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(-0.175954, -78.487357),
    tilt: 59.440,
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreatedCallback,
          onCameraMove: _onCameraMoveCallback,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15,
          ),
          mapType: _currentMapType,
          markers: _markers,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                button(_onMapTypeButtonPressed, Icons.map),
                SizedBox(
                  height: 16.0,
                ),
                button(_onAddMarkerButtonPressed, Icons.add_location),
                SizedBox(
                  height: 16.0,
                ),
                button(_gotoPosition1, Icons.location_searching),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36,
      ),
    );
  }

  void _onMapCreatedCallback(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  void _onCameraMoveCallback(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Future<void> _gotoPosition1() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'This is a Title',
          snippet: 'Es el Snipped',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
}
