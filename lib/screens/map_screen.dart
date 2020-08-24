import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

import '../widgets/app_drawer.dart';

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

  var scaffoldMapKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldMapKey,
      body: Stack(
        children: <Widget>[
          FlutterMap(
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
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                tileProvider: CachedNetworkTileProvider(),
              ),
              MarkerLayerOptions(markers: markers),
              userLocationOptions
            ],
          ),
          Positioned(
            top: 60,
            left: 15,
            child: FloatingActionButton(
              onPressed: () {
                scaffoldMapKey.currentState.openDrawer();
              },
              child: Icon(
                Icons.menu,
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 15,
            child: FloatingActionButton(
              onPressed: () {
                print('I pressed search.');
              },
              child: Icon(Icons.search),
            ),
          ),
          Positioned(
            right: 15,
            bottom: 40,
            child: FloatingActionButton(
              onPressed: onLocationChangeTap,
              mini: true,
              child: Icon(
                  _liveUpdate ? Icons.my_location : Icons.location_searching),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }

  void dispose() {
    super.dispose();
    markerlocationStream.close();
  }
}
