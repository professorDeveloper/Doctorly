import 'dart:convert';

import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/screens/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';
import '../../helpers/drawer_item.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
bool isCyrillic(String text) {
  final cyrillicRegex = RegExp(r'[\u0400-\u04FF]'); // Cyrillic characters range
  return cyrillicRegex.hasMatch(text);
}


class _MainScreenState extends State<MainScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, String>? locationDetails;

  @override
  void initState() {
    super.initState();
    // Using addPostFrameCallback to ensure it's executed after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchLocationDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColor.White,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.White,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                child: SvgPicture.asset(AppImages.menu),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF3F5F8),
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      openScreen(context, CurrentLocationScreen());
                    },

                    child: locationDetails == null
                        ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!, // Light base color
                      highlightColor: Colors.grey[100]!, // Light highlight color
                      child: Container(
                        width: 200, // Make the shimmer effect the same width as your text
                        height: 20, // Adjust height according to the text size
                        color: Colors.white, // Color of the shimmer placeholder
                      ),
                    ) // Shimmer effect while loading
                        : Text(
                      locationDetails!['formatted_address']??"qweqweqwew",
                      style: AppStyle.sfproDisplay16Nonormal.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_forward_ios, size: 10),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                child: SvgPicture.asset(AppImages.notification),
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Device
                .get()
                .isAndroid ? 35 : 50,),
            Row(
              children: [
                SizedBox(width: 12,),
                SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundColor: AppColor.Gray2,
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/108933534?v=4"),
                    )),
                SizedBox(width: 12,),
                Column(
                  children: [
                    Text("Eshonov Fakhriyor",
                      style: AppStyle.sfproDisplay16Black.copyWith(
                          fontWeight: FontWeight.w600
                      ),),
                    Text("+998 97 628 28 82",
                      style: AppStyle.sfproDisplay14w400Black.copyWith(
                          color: AppColor.Gray5
                      ),)
                  ],
                )
              ],
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  buildMenuItem(Icons.history, 'Buyurtmalar tarixi'),
                  buildMenuItem(Icons.person, 'Mening konsultatsiyalarim'),
                  buildMenuItem(Icons.card_membership, 'Tibbiy kartalar'),
                  buildMenuItem(Icons.headset, 'Biz bilan bog\'lanish'),
                  buildMenuItem(Icons.share, 'Ulashish'),
                  buildMenuItem(Icons.star, 'Ilovani baholash'),
                  buildMenuItem(
                    Icons.language,
                    'Ilova tili',
                    trailing: Text(
                      'O\'zbekcha',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  buildMenuItem(Icons.privacy_tip, 'Maxfiylik siyosati'),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  // Add logout functionality
                },
                child: Text(
                  'Tizimdan chiqish',
                  style: TextStyle(color: AppColor.Gray5, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Color(0x3316a1e7),
                    Color(0x3383ffb2),
                    Color(0x33ef8989)
                  ])),
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 120,
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Diqqat! Super chegirma!",
                        style: AppStyle.sfproDisplay18Black.copyWith(
                            color: AppColor.Black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            text: 'Birinchi tibbiy hodim chaqiriviga',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2, right: 2),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 2),
                                      child: Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                text: '\nchegirmaga ega bo’ling!',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Image(
                        image: AssetImage(AppImages.discount),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "Bizning Xizmatlar",
                style: AppStyle.sfProDisplay22w600.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.Gray1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: AssetImage(AppImages.tezyordam),
                          width: 100,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tez yordam chaqirish",
                        style: AppStyle.sfproDisplay14w400Black
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: AppColor.Gray1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: AssetImage(AppImages.tibbiyhodim),
                          width: 100,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tibbiy hodim chaqirish",
                        style: AppStyle.sfproDisplay14w400Black
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 14,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),

                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: AppColor.Gray1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: AssetImage(AppImages.psixolog),
                          width: 100,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Psixolog ko’rigi",
                        style: AppStyle.sfproDisplay14w400Black
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: AppColor.Gray1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                          image: AssetImage(AppImages.vrachpic),
                          width: 100,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vrachni chaqirish",
                        style: AppStyle.sfproDisplay14w400Black
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.Gray1,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(AppImages.massaj),
                                        width: 80,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Massaj",
                                  style: AppStyle.sfproDisplay14w400Black
                                      .copyWith(fontSize: 12),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.Gray1,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(AppImages.labaratory),
                                        width: 80,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Laboratoriya",
                                  style: AppStyle.sfproDisplay14w400Black
                                      .copyWith(fontSize: 12),
                                )
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.Gray1,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(AppImages.hospitals),
                                        width: 80,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Klinikalar",
                                  style: AppStyle.sfproDisplay14w400Black
                                      .copyWith(fontSize: 12),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.Gray1,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image:
                                        AssetImage(AppImages.topshifokor),
                                        width: 80,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Shifokor ko’rigiga yozilish",
                                  style: AppStyle.sfproDisplay14w400Black
                                      .copyWith(fontSize: 12),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColor.Gray1,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Oilaviy shifokor bilan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 2, right: 2),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: AppColor.BlueMain,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 2),
                                              child: Text(
                                                '50%',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                        text: 'konsultasiya',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image(
                                  height: 200,
                                  fit: BoxFit.cover,
                                  image: AssetImage(AppImages.consulation),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // appBar: ,
      // body: ,
      //lala
    );
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
  Future<Map<String, String>> getCurrentLocationDetails() async {
    try {
      // Get the current location using Geolocator
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Google Geocoding API URL
      String apiKey = "AIzaSyDlyelUlpPGiEtnNjZmTi002Ce0ezXyVi8"; // Replace with your actual Google API key
      String url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position
          .latitude},${position.longitude}&key=$apiKey';

      // Fetch the data from Google Geocoding API
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data['results'].isNotEmpty) {
          var addressComponents = data['results'][0]['address_components'];
          var formattedAddress = data['results'][0]['formatted_address'];

          // Extract city (locality), district (tuman), and street (ko‘cha)
          String city = '';
          String district = '';
          String street = '';

          for (var component in addressComponents) {
            if (component['types'].contains('locality')) {
              city = component['long_name'];
            }
            if (component['types'].contains('sublocality_level_1') ||
                component['types'].contains('administrative_area_level_2')) {
              district = component['long_name'];
            }
            if (component['types'].contains('route')) {
              street = component['long_name'];
            }
          }

          return {
            'city': city.isNotEmpty ? city : 'City not found',
            'district': district.isNotEmpty ? district : 'District not found',
            'address': formattedAddress,
            'street': street.isNotEmpty ? street : 'Street not found',
          };
        } else {
          throw Exception('No address found for the current location.');
        }
      } else {
        throw Exception('Failed to fetch location details from Google Maps.');
      }
    } catch (e) {
      throw Exception('Error fetching location details: $e');
    }
  }
}
