import 'package:doctorly/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.White,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
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
                  Text(
                    "Toshkent Sh, Chilonzor Tumani...",
                    style: AppStyle.sfproDisplay16Nonormal.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
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
                  child: Column(
                    children: [
                      Container(
                        width: 200,
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
                                        borderRadius: BorderRadius.circular(20)),
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
                                        borderRadius: BorderRadius.circular(20)),
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
                                        borderRadius: BorderRadius.circular(20)),
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
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(AppImages.topshifokor),
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height:15 ,),
                                RichText(
                                  text:  const TextSpan(
                                    text: 'Oilaviy shifokor bilan',
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
                                              color: AppColor.BlueMain,
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
                                        text: 'konsultasiya',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Image(
                                  height: 180,
                                  fit: BoxFit.cover,
                                  image: AssetImage(AppImages.consulation),
                                ),
                                SizedBox(height: 1,),
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
            )
          ],
        ),
      ),
      // appBar: ,
      // body: ,
      //lala
    );
  }
}
