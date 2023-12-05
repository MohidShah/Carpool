import 'package:carpool/Controller/preBookRideScreenController.dart';
import 'package:carpool/exportlinks.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PreBookRideScreen extends StatefulWidget {
  PreBookRideScreen({Key? key}) : super(key: key);

  @override
  _PreBookRideScreenState createState() => _PreBookRideScreenState();
}

class _PreBookRideScreenState extends State<PreBookRideScreen> {
  final controller = Get.put(PreBookRideController());
  late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0), // Set initial map center to (0,0)
                zoom: 15.0,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  color: Colors.blue,
                  points: polylineCoordinates,
                ),
              },
            ),
            // Rest of your UI widgets
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      var userLocation = await location.getLocation();
      mapController.animateCamera(
        CameraUpdate.newLatLng(
            LatLng(userLocation.latitude!, userLocation.longitude!)),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // This method will be called when the user selects a location
  void _onLocationSelected(LatLng selectedLocation) {
    // You can add the logic here to draw the polyline
    // For example, add the selectedLocation to the polylineCoordinates list
    setState(() {
      polylineCoordinates = [LatLng(0.0, 0.0), selectedLocation];
    });

    // Additionally, you might want to update the camera position
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(0.0, 0.0),
          northeast: selectedLocation,
        ),
        50.0, // Padding for the bounds
      ),
    );
  }
}
