import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late YandexMapController _yandexMapController;
  Point _currentPosition = Point(latitude: 41.2995, longitude: 69.2401); // Default to Tashkent
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Request location permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Location permission denied. Please enable it in settings.'),
        ));
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition =
            Point(latitude: position.latitude, longitude: position.longitude);
        _isLoading = false;
      });

      // Move the Yandex camera to the current position
      _yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition,
            zoom: 14.0,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error fetching location: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          YandexMap(
            onMapCreated: (controller) {
              _yandexMapController = controller;
              _yandexMapController.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: _currentPosition, zoom: 14.0),
                ),
              );
            },
            onMapTap: (Point point) {
              setState(() {
                _currentPosition = point;
              });
            },
            zoomGesturesEnabled: true,
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.0, left: 15.0, right: 15.0),
            child: Row(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  mini: true,
                  onPressed: _getCurrentLocation,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
