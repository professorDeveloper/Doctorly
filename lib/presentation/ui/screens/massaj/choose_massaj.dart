import 'package:doctorly/core/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';
import '../../../../navigator/navigator.dart';
import '../tibbiy_hodim/apple_maps.dart';
import '../tibbiy_hodim/location_page.dart';

class ChooseMassajScreen extends StatefulWidget {
  const ChooseMassajScreen({super.key});

  @override
  State<ChooseMassajScreen> createState() =>
      _ChooseServicesTibbiyHodimState();
}

class _ChooseServicesTibbiyHodimState extends State<ChooseMassajScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.White,
        elevation: Device.get().isAndroid ? 0.4 : 0.1,
        leading: IconButton(
          style: ButtonStyle(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Massaj',
          style: AppStyle.sfproDisplay16Black,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Adjust height as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 18),
            child: SizedBox(
              height: 52,
              child: TextField(
                style: TextStyle(
                  fontFamily: "SfProDisplay",
                  color: AppColor.Black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Qidiruv...",
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: AppColor.Gray3, fontSize: 13),
                  filled: true,
                  fillColor: AppColor.Gray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColor.Gray,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColor.Gray,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColor.BlueMain, // Change this to focus color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.05,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: AppColor.White,
            margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.Gray1,
                        ),
                        child: SvgPicture.asset(
                          AppImages.massajicon,
                          height: 36,
                          width: 36,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Bekor qarash",
                          style: AppStyle.sfproDisplay16Black
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "100 000 сум",
                          style: AppStyle.sfproDisplay14w400Gray5,
                        )
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 120,
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Umumiy summa",
                  style: AppStyle.sfproDisplay16Gray5,
                ),
                Spacer(),
                Text(
                  "100 000 сум",
                  style: AppStyle.sfproDisplay18Black.copyWith(
                      fontSize: 16,
                      color: AppColor.BlueMain,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              child: MaterialButton(
                color: AppColor.BlueMain,
                onPressed: () async {
                  Device.get().isAndroid
                      ? openScreen(context, CurrentLocationScreen())
                      : openScreen(context, CurrentLocationScreenForApple());
                },
                elevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                height: 55,
                textColor: AppColor.White,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Text("Davom etish"),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
