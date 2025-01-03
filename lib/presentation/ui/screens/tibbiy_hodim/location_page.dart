import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/presentation/ui/screens/tibbiy_hodim/apple_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../core/helper/location.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  GoogleMapController? _mapController;
  var currentPosition = LatLng(41.2995, 69.2401); // Default to Tashkent
  bool _isLoading = true;
  Map<String, String> locationDetails = {};
  var current = 0;
  var currentitem = 0;
  var isForChild = true;
  var numthreeformatter = MaskTextInputFormatter(
    mask: '###',

    filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );

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
          content: Text('Location permission denied.'),
        ));
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      locationDetails = await getCurrentLocationDetails();
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
                  onTap: (coordinates) async {
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    locationDetails = await getCurrentLocationDetails();
                    setState(() {
                      currentPosition = coordinates;
                      fetchLocationDetails();
                    });
                  },
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: currentPosition,
                    zoom: 18.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('currentLocation'),
                      position: currentPosition,
                    ),
                  },
                ),

          DraggableScrollableSheet(
            minChildSize: 0.5,
            initialChildSize: 0.5,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColor.Gray1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColor.White,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 13.5,
                                top: 15,
                              ),
                              child: Text('Kichik tibbiy hodim chaqirish',
                                  style: AppStyle.sfproDisplay18Black.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(0xffF0F6FE)),
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 14.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: AppColor.Black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        maxLines: 1,
                                        '${locationDetails!['city']}, ${locationDetails!['address']}',
                                        style: AppStyle.sfproDisplay16Black
                                            .copyWith(
                                            fontSize: 15.5,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Podyezd",
                                            style: AppStyle.sfproDisplay14w400Black
                                                .copyWith(fontSize: 12),
                                          ),
                                          Container(
                                            height: 40,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: "1",
                                                  hintStyle: AppStyle
                                                      .sfproDisplay14w400Gray5),
                                              maxLines: 1,
                                              inputFormatters: [numthreeformatter],
                                              style:
                                              AppStyle.sfproDisplay14w400Black,
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Qavat",
                                            style: AppStyle.sfproDisplay14w400Black
                                                .copyWith(fontSize: 12),
                                          ),
                                          Container(
                                            height: 40,
                                            child: TextField(
                                              maxLines: 1,
                                              inputFormatters: [numthreeformatter],
                                              decoration: InputDecoration(
                                                  hintText: "4",
                                                  hintStyle: AppStyle
                                                      .sfproDisplay14w400Gray5),
                                              style:
                                              AppStyle.sfproDisplay14w400Black,
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Xonadon",
                                            style: AppStyle.sfproDisplay14w400Black
                                                .copyWith(fontSize: 12),
                                          ),
                                          Container(
                                            height: 40,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: "56",
                                                  hintStyle: AppStyle
                                                      .sfproDisplay14w400Gray5),
                                              maxLines: 1,
                                              inputFormatters: [numthreeformatter],
                                              style:
                                              AppStyle.sfproDisplay14w400Black,
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.White,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isForChild = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: isForChild
                                          ? AppColor.Gray1
                                          : AppColor.White,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Center(
                                        child: Text(
                                          "Bolalar uchun",
                                          style:
                                          AppStyle.sfproDisplay14w400Black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isForChild = false;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: !isForChild
                                          ? AppColor.Gray1
                                          : AppColor.White,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Center(
                                        child: Text(
                                          "Kattalar uchun",
                                          style:
                                          AppStyle.sfproDisplay14w400Black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.White,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      current = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: current == 0
                                          ? AppColor.Gray1
                                          : AppColor.White,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Center(
                                        child: Text(
                                          "Farqi yo’q",
                                          style:
                                          AppStyle.sfproDisplay14w400Black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      current = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: current == 1
                                          ? AppColor.Gray1
                                          : AppColor.White,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                AppImages.maleIcon),
                                            Text(
                                              "Erkak",
                                              style: AppStyle
                                                  .sfproDisplay14w400Black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      current = 2;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: current == 2
                                          ? AppColor.Gray1
                                          : AppColor.White,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                AppImages.femaleIcon),
                                            Text(
                                              "Ayol",
                                              style: AppStyle
                                                  .sfproDisplay14w400Black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        color: AppColor.White,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColor.Gray1,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Spacer(),
                                              Text(
                                                "Tibbiy karta",
                                                style: AppStyle
                                                    .sfproDisplay14w400Gray5
                                                    .copyWith(
                                                    fontSize: 12,
                                                    color: AppColor.Gray4),
                                              ),
                                              Text(
                                                "O’zim uchun",
                                                style: AppStyle.sfproDisplay15Black,
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColor.Black,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: AppColor.White,
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(
                                              color: AppColor.BlueMain,
                                              width: 0.4)),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Umumiy summa",
                                              style: AppStyle
                                                  .sfproDisplay14w400Black
                                                  .copyWith(fontSize: 12),
                                            ),
                                            Text(
                                              "100 000 сум",
                                              style: AppStyle.sfproDisplay16Black
                                                  .copyWith(
                                                  color: AppColor.BlueMain,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 15,
                              ),
                              SvgPicture.asset(
                                AppImages.moneyic,
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColor.BlueMain,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Buyurtma Berish",
                                      style: AppStyle.sfproDisplay15Black.copyWith(
                                        color: AppColor.White,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SvgPicture.asset(
                                AppImages.filteric,
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 15.0,
              left: 15,
              bottom: MediaQuery.of(context).size.height * 0.51,
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
