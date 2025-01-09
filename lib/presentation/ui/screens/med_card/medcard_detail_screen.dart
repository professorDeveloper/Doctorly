import 'package:doctorly/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class MedcardDetailScreen extends StatefulWidget {
  const MedcardDetailScreen({super.key});

  @override
  State<MedcardDetailScreen> createState() => _MedcardDetailScreenState();
}

class _MedcardDetailScreenState extends State<MedcardDetailScreen> {
  var currentIndex = 0;
  var list = [
    "Barchasi",
    "Qon tahlillari",
    "Labaratoriya",
    "Gepatolog",
    "Qon tahlillari",
    "Labaratoriya",
    "Gepatolog"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColor.White,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(300),
          // Adjust this value based on your content
          child: Container(
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
                              width: 0.5,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE6F2FF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: list.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  currentIndex = index;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  decoration: ShapeDecoration(
                                    color: index == currentIndex
                                        ? AppColor.BlueMain
                                        : Color(0xFFF3F5F7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        list[index],
                                        style: TextStyle(
                                          color: currentIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 1.40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
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
              'Tibbiy karta haqida',
              style: AppStyle.sfproDisplay16Black,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  // openScreen(context, AddMedcardScreen());
                },
                icon: SvgPicture.asset(
                  AppImages.edit,
                  color: AppColor.BlueMain,
                ))
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.Gray1,
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

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
                            '10.12.2024, 21:16',
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
                            'Labaratoriya tahlillari',
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
                    const SizedBox(height: 12),
                    Container(
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
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    SizedBox(
                        height: 32,
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: AppColor.Gray2,
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/108933534?v=4"),
                        )),
                    SizedBox(width: 12,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eshonov Fakhriyor',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Terapevt',
                          style: TextStyle(
                            color: Color(0xFF5E646B),
                            fontSize: 11,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],)
          );
        },
      ),
    );
  }
}
