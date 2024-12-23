import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/helper/location.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = LatLng(41.2995, 69.2401); // Tashkent as default
  bool _isLoading = true;

   Map<String, String> locationDetails={};

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Check location permission
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

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      locationDetails = await getCurrentLocationDetails();
      print(locationDetails);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);

        _isLoading = false;
      });

      // Move the map to the current position
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _currentPosition, zoom: 14.0),
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
    setState(() {}); // Update the UI after fetching location details
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onTap: (coordinates) async{
              _currentPosition=coordinates;
              await fetchLocationDetails();
              setState(() {

              });
            },
            zoomControlsEnabled: false,
            // Disable zoom buttons
            zoomGesturesEnabled: true,
            // Disable pinch-to-zoom gestures
            scrollGesturesEnabled: true,
            // Disable scrolling (optional)
            onMapCreated: _onMapCreated,

            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('currentLocation'),
                position: _currentPosition,
              ),

            },
          ),
          DraggableScrollableSheet(
            minChildSize: 0.4,

            initialChildSize: 0.4,
            // Initial size (0.25 means 25% of the screen height)
            maxChildSize: 0.4,
            // Maximum size of the bottom sheet
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
                      padding: const EdgeInsets.only(
                        left: 13.5,
                        top: 15,
                      ),
                      child: Text('Kichik tibbiy hodim chaqirish',
                          style: AppStyle.sfproDisplay18Black
                              .copyWith(fontWeight: FontWeight.w500,fontSize: 16)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffF0F6FE)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          children: [
                            SizedBox(width: 14,),
                            Icon(
                              Icons.location_on,
                              color: AppColor.Black,
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(

                                maxLines: 1,
                                '${locationDetails!['city']}, ${locationDetails!['address']}',
                                style: AppStyle.sfproDisplay16Black.copyWith(fontSize: 15.5,overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            SizedBox(width: 10,),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                right: 15.0, left: 15, bottom: Device.height / 100 * 16),
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
