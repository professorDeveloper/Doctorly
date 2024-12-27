import 'dart:async';

import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/screens/auth/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../bloc/verify/verify_bloc.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../utils/utils.dart';
import '../../helpers/flushbar.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({required this.phone});

  String phone;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late VerifyBloc bloc;
  var progress = false;
  var isError = false;
  var error = StreamController();
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<VerifyBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyBloc, VerifyState>(
      listener: (context, state) {
        controller.removeListener(() {
          isError = false;
          setState(() {});
        });
        if (state is VerifySuccess) {
          Navigator.of(context).pop();
          openScreen(
              context,
              RegisterScreen(
                pohne: widget.phone,
                tokenForAccess: state.sendSmsCodeResponse.token,
              ));
        }

        if (state is VerifyFailure) {
          isError = true;
          setState(() {});
          progress = false;
        }
        if (state is VerifyLoading) {
          progress = true;
          setState(() {});
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.Bg,
          appBar: AppBar(
            backgroundColor: AppColor.White,
            elevation: Device.get().isAndroid ? 0.4 : 0.1,
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
                    formatPhoneNumber(widget.phone),
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
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: PinCodeTextField(
                      appContext: context,
                      controller: controller,
                      autoFocus: true,
                      length: 6,
                      keyboardType: TextInputType.number,
                      textStyle: AppStyle.sfproDisplay15Black,
                      cursorColor: Colors.white,
                      onEditingComplete: () {},
                      onCompleted: (v) {
                        print("sybnitted");
                        bloc.add(VerifyButtonPressed(
                            phone: widget.phone, code: int.parse(v)));
                      },
                      hintCharacter: "0",
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        errorBorderWidth: 1,
                        errorBorderColor: AppColor.RedMain,
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 55,
                        fieldWidth: 55,
                        activeBorderWidth: 1,
                        selectedBorderWidth: 1,
                        activeFillColor: AppColor.White,
                        inactiveFillColor: AppColor.Gray,
                        selectedFillColor: Colors.white,
                        activeColor:
                            isError ? AppColor.RedMain : AppColor.BlueMain,
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
      },
    );
  }
}
