import 'package:doctorly/core/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';
import 'doctor_info_bottomsheet.dart';

class MedicalExaminationScreen extends StatefulWidget {
  const MedicalExaminationScreen({super.key});

  @override
  State<MedicalExaminationScreen> createState() =>
      _MedicalExaminationScreenState();
}

class _MedicalExaminationScreenState extends State<MedicalExaminationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 18,
              offset: Offset(0, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  'Ko’rik davomiyligi',
                  style: TextStyle(
                    color: Color(0xFF8F96A0),
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
                Spacer(),
                Text(
                  '02:59',
                  style: TextStyle(
                    color: AppColor.Black,
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
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
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.BlueMain,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.phone,
                            color: AppColor.White,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Qo’ng’iron qilish",
                      style: AppStyle.sfproDisplay14w400Gray5
                          .copyWith(
                        fontSize: 12,
                        color: AppColor.Gray4,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.Gray1,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppImages.operator)

                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Qo’llab quvvatlash",
                      style: AppStyle.sfproDisplay14w400Gray5
                          .copyWith(
                        fontSize: 12,
                        color: AppColor.Gray4,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
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
                'Ko’rik №123652',
                style: AppStyle.sfproDisplay16Black,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Color(0xFF00A732),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(50) ,
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Aktiv ko’rik',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColor.Gray1,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 14.5),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDoctorInfo(context);
                      },
                      child: Container(
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
                                      height: 55,
                                      width: 55,
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
                                                    fontWeight: FontWeight.w500,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ma’lumotlar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text(
                          'To’lov turi',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Naqd',
                          style: TextStyle(
                            color: AppColor.Black,
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
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
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text(
                          'Chaqirilgan vaqt',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '12.12.2024, 21:25',
                          style: TextStyle(
                            color: AppColor.Black,
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
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
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text(
                          'Tibbiy karta',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'O’zim uchun',
                          style: TextStyle(
                            color: AppColor.Black,
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
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
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text(
                          'To’lov summasi',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '100 000 сум',
                          style: TextStyle(
                            color: AppColor.BlueMain,
                            fontSize: 15,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ])),
          SizedBox(
            height: 18,
          ),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Manzil ma’lumotlari',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Toshkent Shahar, Yunusobod 6, 20 uy',
                    style: TextStyle(
                      color: Color(0xFF5E646B),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 133,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Izoh',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the ',
                    style: TextStyle(
                      color: Color(0xFF5E646B),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}
