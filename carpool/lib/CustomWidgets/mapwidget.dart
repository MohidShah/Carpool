// import 'package:carpool/exportlinks.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _mapController;
  Position? position;
  Position? _currentPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);
  LatLng currentLatLng = LatLng(0, 0);
  BitmapDescriptor? bitmapDescriptor;
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _getCurrentLocation();
  }

  void _checkLocationPermission() async {
    // Check if location permissions are granted
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      _getCurrentLocation();
    } else if (status.isDenied) {
      // Request location permissions
      PermissionStatus newStatus = await Permission.locationWhenInUse.request();
      if (newStatus.isGranted) {
        _getCurrentLocation();
      }
    } else if (status.isPermanentlyDenied) {
      // Location permissions are permanently denied, open settings
      openAppSettings();
    }
  }

  void _getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;

        print(_currentPosition!.latitude);
        print(_currentPosition!.longitude);
      });
    } catch (e) {
      print('Could not get current location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onCameraMove: (position) {
        print(position);
        currentLatLng =
            LatLng(position.target.latitude, position.target.longitude);
      },
      onMapCreated: (controller) {
        setState(() {
          _mapController = controller;
        });
      },
      mapType: MapType.normal,
      markers: _currentPosition != null
          ? {
              Marker(
                markerId: MarkerId('UserLoc'),
                position: LatLng(
                  _currentPosition!.latitude,
                  _currentPosition!.longitude,
                ),
                infoWindow: InfoWindow(
                  title: 'User Location',
                ),
              ),
              Marker(
                markerId: MarkerId('DriverLoc'),
                position: LatLng(24.91330678367391, 67.10092920809984),
                infoWindow: InfoWindow(
                  title: 'Driver Location',
                ),
              ),
            }
          : {},
      polygons: {
        Polygon(
          polygonId: PolygonId('routePolygon'),
          points: [
            //passenger loc
            LatLng(
              _currentPosition!.latitude,
              _currentPosition!.longitude,
            ),
            //driver loc
            LatLng(24.91330678367391, 67.10092920809984)
          ],
          strokeWidth: 5,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.3),
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(_currentPosition!.latitude,
            _currentPosition!.longitude), // Initial map center
        zoom: 0.0, // Initial zoom level
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      cloudMapId: 'AIzaSyAqXM_XIUKgYMHTWcggt1hhow0igu9R2CI',
    );
  }
}
