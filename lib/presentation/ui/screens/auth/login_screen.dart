import 'package:doctorly/animations/custom_animation.dart';
import 'package:doctorly/core/constants/app_images.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/helpers/flushbar.dart';
import 'package:doctorly/presentation/ui/screens/auth/verify_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../bloc/login/send_sms_code_bloc.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../utils/my_pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneController = TextEditingController();
  late SendSmsCodeBloc bloc;
  bool phoneEmpty = false;
  var progress = false;

  var maskFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<SendSmsCodeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SendSmsCodeBloc, SendSmsCodeState>(
        listener: (context, state) async {
          if (state is SendSmsCodeSuccess) {
            progress = false;
            setState(() {});
            showSuccessFlushBar("Kod jontaildi !").show(context);
            openScreen(
                context,
                VerifyScreen(
                  phone: "998${maskFormatter.getUnmaskedText()}",
                ));
          }
          if (state is SendSmsCodeLoading) {
            progress = true;

            setState(() {});
          }
          if (state is SendSmsCodeFailure) {
            progress = false;
            setState(() {
              showErrorFlushBar(state.error).show(context);
            });
            print(state.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.loginpic,
                        height: 170,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Text(
                            "Tizimga kirish",
                            style: AppStyle.sfProDisplay24w600,
                          ),
                          Text(
                            "Tizimga kirish uchun telefon\nraqamingizni kiritishingiz kerak bo’ladi!",
                            style: AppStyle.sfproDisplay16Nonormal,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: Device.get().isAndroid ? 30 : 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Telefon raqamingiz",
                        style: AppStyle.sfproDisplay14w400Black,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        autofocus: true,
                        inputFormatters: [maskFormatter],
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: AppColor.Black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: AppColor.Gray2),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // Ensures Row takes only necessary width
                              children: [
                                Icon(Icons.phone, color: AppColor.BlueMain),
                                SizedBox(width: 14),
                                Text(
                                  '+998',
                                  style: TextStyle(
                                    fontFamily: "SfProDisplay",
                                    color: AppColor.Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                              color: AppColor
                                  .BlueMain, // Change this to focus color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomAnimationsSlide(
                  direction: FadeSlideDirection.btt,
                  duration: 0.8,
                  child: Container(
                    height: Device.get().isAndroid ? 55 : 57,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: MaterialButton(
                      color: AppColor.BlueMain,
                      onPressed: () async {
                        print("lala");
                        if (phoneController.text.isEmpty) {
                          showErrorFlushBar("Telfon kiritilmagan !")
                              .show(context);
                        } else {
                          bloc.add(SendSmsCodeButtonPressed(
                              phone: "998${maskFormatter.getUnmaskedText()}"));
                        }
                      },
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      textColor: AppColor.White,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: progress
                          ? Center(child: CircularProgressIndicator(color: Colors.white,))
                          : Row(
                              children: [
                                Spacer(),
                                Text("Tizimga kirish"),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
