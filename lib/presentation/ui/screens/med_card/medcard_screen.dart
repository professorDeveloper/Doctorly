import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/screens/med_card/add_medcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';
import 'medcard_detail_screen.dart';

class MedcardScreen extends StatefulWidget {
  const MedcardScreen({super.key});

  @override
  State<MedcardScreen> createState() => _MedcardScreenState();
}

class _MedcardScreenState extends State<MedcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Gray1,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColor.White,
        elevation: Device.get().isAndroid ? 0.4 : 0.1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Spacer(),
            Text(
              'Tibbiy kartalar',
              style: AppStyle.sfproDisplay16Black,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  openScreen(context, AddMedcardScreen());
                },
                icon: Icon(
                  Icons.add,
                  color: AppColor.BlueMain,
                ))
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                openScreen(context, MedcardDetailScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE6F2FF),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppImages.profile),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'O’zim uchun',
                              style: TextStyle(
                                color: Color(0xFF5E646B),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Eshonov Fakhriyor',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 1.40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tug’ilgan yili',
                                  style: TextStyle(
                                    color: Color(0xFF8F96A0),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '17.12.1998 (25 yosh)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: double.infinity,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.5,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFE6F2FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jinsi',
                                  style: TextStyle(
                                    color: Color(0xFF8F96A0),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Erkak',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: double.infinity,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.5,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFE6F2FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Manzil',
                                  style: TextStyle(
                                    color: Color(0xFF8F96A0),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Farg’ona Shahar, Lorem ipsum ko’chasi.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE6F2FF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 151.50,
                            padding: const EdgeInsets.symmetric(
                                 vertical: 12),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF3F5F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: SvgPicture.asset(AppImages.edit),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Tahrirlash',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
                            decoration: ShapeDecoration(
                              color: AppColor.BlueMain,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Text(
                              'Batafsil tanishish',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 1.40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
