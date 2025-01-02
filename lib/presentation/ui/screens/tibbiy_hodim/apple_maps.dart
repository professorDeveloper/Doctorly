import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/presentation/ui/screens/tibbiy_hodim/apple_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/helper/location.dart';

class CurrentLocationScreenForApple extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreenForApple> {
  var currentPosition = LatLng(41.2995, 69.2401); // Default to Tashkent
  bool _isLoading = true;
  Map<String, String> locationDetails = {};
  late AppleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void appleMapCreated(AppleMapController controller) {
    _mapController = controller;
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
          content: Text('Location permission denied.'),
        ));
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      locationDetails = await getCurrentLocationDetails();
      print("getted");
      setState(() {});
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });

      // Animate camera to current position
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosition, zoom: 16.0),
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

  Future<void> fetchLocationDetails() async {
    // Check and request location permission
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location permission denied.'),
      ));
      return;
    }

    locationDetails = await getCurrentLocationDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppleMap(
            annotations: {
              Annotation(
                  annotationId: AnnotationId("annotation_1"),
                  position: currentPosition,
                  icon:BitmapDescriptor.markerAnnotation)
            },
            onMapCreated: appleMapCreated,
            initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: 15.0,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.4,
            initialChildSize: 0.4,
            maxChildSize: 0.4,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.5, top: 15),
                      child: Text(
                        'Kichik tibbiy hodim chaqirish',
                        style: AppStyle.sfproDisplay18Black.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Rest of your widget structure
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 15.0,
              left: 15,
              bottom: MediaQuery.of(context).size.height * 0.41,
            ),
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
                    color: AppColor.Black,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  mini: true,
                  onPressed: _getCurrentLocation,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.location_on,
                    color: AppColor.RedMain,
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
