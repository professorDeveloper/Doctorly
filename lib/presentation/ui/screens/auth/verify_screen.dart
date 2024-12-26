import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/screens/auth/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_color.dart';

class VerifyScreen extends StatefulWidget {
   VerifyScreen({required this.phone});
   String phone;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Bg,
      appBar: AppBar(
        backgroundColor: AppColor.White,
        elevation:Device.get().isAndroid?0.4:0.1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Telefon raqamni tasdiqlang',
          style: AppStyle.sfproDisplay16Black,
        ),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Image(
                  image: AssetImage(AppImages.verifyIcon),
                  width: 137,
                  height: 92,
                ),
              ),
              SizedBox(height: 18),
              Text(
                textAlign: TextAlign.center,
                "+998 97 628 28 82",
                style: AppStyle.sfProDisplay24w600,
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Telefon raqamiga 4 xonali kod yuborildi,ushbu \n kodni kiririting!",
                  style: AppStyle.sfproDisplay16Gray5,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: PinCodeTextField(
                  appContext: context,
                  autoFocus: true,
                  length: 5,
                  keyboardType: TextInputType.number,
                  textStyle: AppStyle.sfproDisplay15Black,
                  cursorColor: Colors.white,
                  onCompleted: (v){
                    openScreen(context, RegisterScreen());
                  },
                  hintCharacter: "0",
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeBorderWidth: 1,
                    selectedBorderWidth: 1,
                    activeFillColor: AppColor.White,
                    inactiveFillColor: AppColor.Gray,
                    selectedFillColor: Colors.white,
                    activeColor: AppColor.BlueMain,
                    inactiveColor: AppColor.Gray,
                  ),
                  enableActiveFill: true,
                  onChanged: (value) {
                    debugPrint("Value entered: $value");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
