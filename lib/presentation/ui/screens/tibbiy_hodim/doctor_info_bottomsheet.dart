import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

void showDoctorInfo(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColor.White,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) => FractionallySizedBox(
      heightFactor: 0.95,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: CircleAvatar(
                        backgroundColor: AppColor.Gray2,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/108933534?v=4"),
                      )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
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
                            style: AppStyle.sfproDisplay14w400Black.copyWith(
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
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eshonov Fakhriyor",
                  style: AppStyle.sfproDisplay15Black
                      .copyWith(fontSize: 19)
                      .copyWith(fontWeight: FontWeight.w600),
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
            SizedBox(height: 24,),
            ExpandableText(
              maxLines: 6,
              linkColor: AppColor.BlueMain,
                "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the\n1500s, when an unknown printer took a galley of\ntype and scrambled it to make a type specimen\nbook. It has survived not only five centuries\nLorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the\n1500s, when an unknown printer took a galley of\ntype and scrambled it to make a type specimen\nbook. It has survived not only five centuries",
            style: AppStyle.sfproDisplay16Gray5, expandText: 'Yana',),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                      decoration: ShapeDecoration(
                        color: Color(0xFF007BFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Umumiy ma’lumotlar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
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
                          Text(
                            'Izohlar (589)',
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
                    )
                  ],
                ),
                SizedBox(height: 18,),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Tug’ilgan sanasi',
                                style: TextStyle(
                                  color: Color(0xFF5E646B),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 1.40,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                '13.12.1978',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
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
                      const SizedBox(height: 12),
                      Container(
                        height: 44,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Jinsi',
                                style: TextStyle(
                                  color: Color(0xFF5E646B),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 1.40,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Erkak',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                C
          ]),
        ),
      ),
    ),
  );
}
