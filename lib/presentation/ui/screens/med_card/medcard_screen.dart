import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class MedcardScreen extends StatefulWidget {
  const MedcardScreen({super.key});

  @override
  State<MedcardScreen> createState() => _MedcardScreenState();
}

class _MedcardScreenState extends State<MedcardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            IconButton(onPressed:(){}, icon: Icon(Icons.add,color: AppColor.BlueMain,))
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
