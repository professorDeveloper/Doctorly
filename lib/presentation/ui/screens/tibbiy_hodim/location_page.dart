import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/main.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/screens/tibbiy_hodim/apple_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../../core/helper/location.dart';
import '../../helpers/custom_progress.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final tashkentCoordinates = Point(latitude: 41.3111, longitude: 69.2797);
  final Point endPoint = Point(latitude: 41.2807, longitude: 69.2557);   // Example: Red Square

  var currentPosition =
      Point(latitude: 41.2995, longitude: 69.2401); // Default to Tashkent
  bool _isLoading = true;
  Map<String, String> locationDetails = {};
  var current = 0;
  var pageController = PageController();
  var currentPositon = 0;
  var currentPage = 0;
  late YandexMapController _controller;
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

  void skipLoading() async {
    await Future.delayed(Duration(seconds: 10));
    currentPage = 2;
    setState(() {});
    nextPage();
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
        currentPosition =
            Point(latitude: position.latitude, longitude: position.longitude);
        _isLoading = false;
      });
      _controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: currentPosition,
        zoom: 16, // Adjust zoom level
      )));
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

  void _onMapCreated(YandexMapController controller) {
    _controller = controller;
    _controller.moveCamera(CameraUpdate.newBounds(
      BoundingBox(
        northEast: currentPosition,
        southWest: endPoint,
      ),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: Container(
            padding:
                const EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 150),
            child: YandexMap(
              onMapCreated: _onMapCreated,
              mapObjects: [
                PlacemarkMapObject(
                    mapId: MapObjectId("annotation_1"),
                    point: Point(
                      latitude: currentPosition.latitude,
                      longitude: currentPosition.longitude,
                    ),
                    icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                      AppImages.location,
                    )))),

                PlacemarkMapObject(
                  mapId: MapObjectId("end_placemark"),
                  point: endPoint,
                  icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage('assets/end_pin.png'),
                  )),
                ),
                PolylineMapObject(
                  mapId: MapObjectId("route_polyline"),
                  polyline: Polyline(points: _getRoutePoints()),
                  strokeColor: Colors.blue.withOpacity(0.7),
                  strokeWidth: 5.0,
                ),

              ],
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
            ),
          ),
        ),
        DraggableScrollableSheet(
          minChildSize: 0.5,
          initialChildSize: 0.5,
          maxChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.White,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: ListView(
                      children: [
                        Container(
                          color: AppColor.White,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 13.5,
                                  top: 5,
                                ),
                                child: Text('Kichik tibbiy hodim chaqirish',
                                    style: AppStyle.sfproDisplay18Black
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 12.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color(0xffF0F6FE)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0),
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
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                          style: AppStyle
                                              .sfproDisplay14w400Black
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
                                            inputFormatters: [
                                              numthreeformatter
                                            ],
                                            style: AppStyle
                                                .sfproDisplay14w400Black,
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
                                          style: AppStyle
                                              .sfproDisplay14w400Black
                                              .copyWith(fontSize: 12),
                                        ),
                                        Container(
                                          height: 40,
                                          child: TextField(
                                            maxLines: 1,
                                            inputFormatters: [
                                              numthreeformatter
                                            ],
                                            decoration: InputDecoration(
                                                hintText: "4",
                                                hintStyle: AppStyle
                                                    .sfproDisplay14w400Gray5),
                                            style: AppStyle
                                                .sfproDisplay14w400Black,
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
                                          style: AppStyle
                                              .sfproDisplay14w400Black
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
                                            inputFormatters: [
                                              numthreeformatter
                                            ],
                                            style: AppStyle
                                                .sfproDisplay14w400Black,
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
                        Container(
                          color: AppColor.Gray1,
                          child: Column(
                            children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            isForChild = true;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: isForChild
                                                  ? AppColor.Gray1
                                                  : AppColor.White,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Center(
                                                child: Text(
                                                  "Bolalar uchun",
                                                  style: AppStyle
                                                      .sfproDisplay14w400Black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            isForChild = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: !isForChild
                                                  ? AppColor.Gray1
                                                  : AppColor.White,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Center(
                                                child: Text(
                                                  "Kattalar uchun",
                                                  style: AppStyle
                                                      .sfproDisplay14w400Black,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            current = 0;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: current == 0
                                                  ? AppColor.Gray1
                                                  : AppColor.White,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Center(
                                                child: Text(
                                                  "Farqi yo’q",
                                                  style: AppStyle
                                                      .sfproDisplay14w400Black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            current = 1;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: current == 1
                                                  ? AppColor.Gray1
                                                  : AppColor.White,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                            current = 2;
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: current == 2
                                                  ? AppColor.Gray1
                                                  : AppColor.White,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                            ],
                          ),
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
                                              style:
                                                  AppStyle.sfproDisplay15Black,
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
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      nextPage();
                                      currentPage = 1;
                                      setState(() {});
                                      skipLoading();
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColor.BlueMain,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Buyurtma Berish",
                                          style: AppStyle.sfproDisplay15Black
                                              .copyWith(
                                            color: AppColor.White,
                                          ),
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
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.White,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 27,
                      ),
                      Container(
                        width: 65,
                        height: 65,
                        child: CircularProgressIndicator(
                          color: AppColor.BlueMain,
                          strokeWidth: 8,
                          backgroundColor: AppColor.BlueLight,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Vrach Terapevt qidirilmoqda!",
                        style: AppStyle.sfProDisplay22w600.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Ushbu amaliyotga  1-2 daqiqagacha\nvaqt ketishi mumkin, iltimos ozgina\nkutib turing!",
                        style: AppStyle.sfproDisplay16Black
                            .copyWith(fontSize: 14, color: AppColor.Gray5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.Gray1,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: AppColor.Black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Bekor qilish",
                        style: AppStyle.sfproDisplay14w400Gray5.copyWith(
                          fontSize: 12,
                          color: AppColor.Gray4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.White,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 13.5,
                            top: 24,
                          ),
                          child: Text('30-40 daqiqada uyingizda bo’ladi.',
                              style: AppStyle.sfproDisplay18Black.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Device.get().isAndroid ? 17 : 19)),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 13.5,
                            ),
                            SvgPicture.asset(AppImages.blackLocation),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Toshkent Shahar, Yunusobod 6, 20 uy",
                              style: AppStyle.sfproDisplay14w400Black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 13.5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.Gray1,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: CircleAvatar(
                                          backgroundColor: AppColor.Gray2,
                                          backgroundImage: NetworkImage(
                                              "https://avatars.githubusercontent.com/u/108933534?v=4"),
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Icon(
                                              size: 12,
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              "4.8",
                                              style: AppStyle
                                                  .sfproDisplay14w400Black
                                                  .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor.Black),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Eshonov Fakhriyor",
                                    style: AppStyle.sfproDisplay15Black
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Terapevt ",
                                        style: AppStyle.sfproDisplay14w400Black
                                            .copyWith(color: AppColor.Gray5),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 4,
                                        height: 4,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF8F96A0),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "10 yil tajriba ",
                                        style: AppStyle.sfproDisplay14w400Black
                                            .copyWith(color: AppColor.Gray5),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.Gray5,
                                size: 20,
                              ),
                              SizedBox(width: 8,)
                            ],
                          ),
                        )
                      ]),
                ),
              ],
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
                  if (currentPage == 1) {
                    previousPage();
                    currentPage = 0;
                  } else if(currentPage==2) {
                    previousPage();
                    currentPage = 1;
                  }
                  else{
                    closeScreen(context);
                  }
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
            child: CircularProgressIndicator(
              color: AppColor.BlueMain,
              backgroundColor: AppColor.BlueLight,
            ),
          ),
      ],
    ));
  }

// Simulated route points
List<Point> _getRoutePoints() {
  return [
    currentPosition,
    endPoint,
  ];
}

  void nextPage() {
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page!.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
