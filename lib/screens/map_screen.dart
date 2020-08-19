import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController;
  List<Marker> markers;
  StreamController<LatLng> markerlocationStream;
  UserLocationOptions userLocationOptions;
  bool _liveUpdate;
  LatLng currentPos;
  
  onLocationChangeTap() {
    setState(() {
      if (_liveUpdate) {
        _liveUpdate = false;
        userLocationOptions.updateMapLocationOnPositionChange = false;
      } else {
        _liveUpdate = true;
        _mapController.move(currentPos, _mapController.zoom);
        userLocationOptions.updateMapLocationOnPositionChange = true;
      }
    });
  }

  onDragWithLocationOn() {
    setState(() {
      _liveUpdate = false;
      userLocationOptions.updateMapLocationOnPositionChange = false;
    });
  }

  

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    markerlocationStream = StreamController.broadcast();

    markers = [];

    _liveUpdate = false;

    currentPos = LatLng(49.7437572, 15.3386383);

    userLocationOptions = UserLocationOptions(
        context: context,
        mapController: _mapController,
        markers: markers,
        onLocationUpdate: (LatLng pos) => {currentPos = pos},
        updateMapLocationOnPositionChange: false,
        showMoveToCurrentLocationFloatingActionButton: false,
        zoomToCurrentLocationOnLoad: false,
        fabBottom: 50,
        fabRight: 50,
        verbose: false,
        locationUpdateIntervalMs: 1500);
  }

  @override
  Widget build(BuildContext context) {
    markerlocationStream.stream.listen((onData) {
      //print(onData.latitude);
    });

    return Scaffold(
      body: GestureDetector(
              onHorizontalDragCancel: () {
                if (_liveUpdate) onDragWithLocationOn();
              },
              child: FlutterMap(
          options: MapOptions(
            center: LatLng(49.7437572, 15.3386383),
            zoom: 7.0,
            plugins: [
              UserLocationPlugin(),
            ],
          ),
          mapController: _mapController,
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              tileProvider: CachedNetworkTileProvider(),
            ),
            MarkerLayerOptions(markers: markers),
            userLocationOptions
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 60,
          ),
          FloatingActionButton(
            onPressed: () {
              print('I pressed search.');
            },
            child: Icon(Icons.search),
          ),
          Expanded(child: Container()),
          FloatingActionButton(
            onPressed: onLocationChangeTap,
            mini: true,
            child: Icon(
                _liveUpdate ? Icons.my_location : Icons.location_searching),
          )
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    markerlocationStream.close();
  }
}
