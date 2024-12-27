import 'package:doctorly/bloc/register/register_bloc.dart';
import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/core/constants/app_style.dart';
import 'package:doctorly/navigator/navigator.dart';
import 'package:doctorly/presentation/ui/helpers/uppercase.dart';
import 'package:doctorly/presentation/ui/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../utils/my_pref.dart';
import '../../helpers/flushbar.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({required this.pohne, required this.tokenForAccess, Key? key})
      : super(key: key);
  String pohne;
  String tokenForAccess = '';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameFocus = FocusNode();
  var tuglganfocus = FocusNode();
  var adressfocus = FocusNode();

  var progress=false;
  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  var surnameFocus = FocusNode();
  var serieController = TextEditingController();
  var jsshrController = TextEditingController();
  var serieFocus = FocusNode();
  var jsshrFocus = FocusNode();
  var numberfocus = FocusNode();
  var serieFormatter = MaskTextInputFormatter(
    mask: '##',
    filter: {"#": RegExp(r'[a-z]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );
  var borndateFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );

  String? _selectedGender;
  var passportNumberFormatter = MaskTextInputFormatter(
    mask: '#######',

    filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAnimationsSlide(
        direction: FadeSlideDirection.btt,
        duration: 0.8,
        child: Container(
          height: Device.get().isAndroid ? 55 : 57,
          margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: Device.get().isAndroid ? 30 : 40),
          width: double.infinity,
          child: MaterialButton(
            color: AppColor.BlueMain,
            onPressed: () {
              openScreen(context, MainScreen());
            },
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            textColor: AppColor.White,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Spacer(),
                Text("Yakunlash"),
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
      backgroundColor: AppColor.White,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            setState(() {
              progress = false;
            });
            Prefs.setAccessToken(state.response.accessToken.toString());
            Prefs.setRefreshToken(state.response.refreshToken.toString());
            openReplaceScreen(context, MainScreen());
          }
          if (state is RegisterFailure) {
            setState(() {
              progress = false;
              showErrorFlushBar(state.error).show(context);
            });
          }
          if (state is RegisterLoading) {
            progress = true;

            setState(() {});
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Device.get().isAndroid ? 40 : 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "So’ngi qadam...",
                      style: AppStyle.sfProDisplay24w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Iltimos, ism va familiyangizni kiriting.",
                      style: AppStyle.sfproDisplay16Nonormal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "Ismingiz",
                          style: AppStyle.sfproDisplay14w400Black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        focusNode: nameFocus,
                        controller: nameController,
                        autofocus: true,
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: AppColor.Black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.name,
                        onEditingComplete: () {
                          surnameFocus.requestFocus();
                        },
                        onSubmitted: (v) {
                          surnameFocus.requestFocus();
                        },
                        decoration: InputDecoration(
                          hintText: "Kiriting...",
                          hintStyle:
                              TextStyle(color: AppColor.Gray3, fontSize: 14),
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "Familiyangiz",
                          style: AppStyle.sfproDisplay14w400Black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        focusNode: surnameFocus,
                        onEditingComplete: () {
                          serieFocus.requestFocus();
                        },
                        onSubmitted: (v) {
                          serieFocus.requestFocus();
                        },
                        autofocus: true,
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: AppColor.Black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Kiriting...",
                          hintStyle:
                              TextStyle(color: AppColor.Gray3, fontSize: 14),
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "JSHIRni kiriting",
                          style: AppStyle.sfproDisplay14w400Black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        focusNode: surnameFocus,
                        onEditingComplete: () {
                          serieFocus.requestFocus();
                        },
                        onSubmitted: (v) {
                          serieFocus.requestFocus();
                        },
                        autofocus: true,
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: AppColor.Black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Kiriting...",
                          hintStyle:
                          TextStyle(color: AppColor.Gray3, fontSize: 14),
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "Passport seriya",
                                style: AppStyle.sfproDisplay14w400Black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              focusNode: serieFocus,
                              onSubmitted: (v) {
                                numberfocus.requestFocus();
                              },
                              onEditingComplete: () {
                                numberfocus.requestFocus();
                              },
                              inputFormatters: [
                                serieFormatter,
                                UpperCaseTextFormatter()
                              ],
                              autofocus: true,
                              style: TextStyle(
                                fontFamily: "SfProDisplay",
                                color: AppColor.Black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "AD",
                                hintStyle: TextStyle(
                                    color: AppColor.Gray3, fontSize: 14),
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
                        width: 14,
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                "Passport raqami",
                                style: AppStyle.sfproDisplay14w400Black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              focusNode: numberfocus,
                              inputFormatters: [passportNumberFormatter],
                              autofocus: true,
                              style: TextStyle(
                                fontFamily: "SfProDisplay",
                                color: AppColor.Black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "(46165432)",
                                hintStyle: TextStyle(
                                    color: AppColor.Gray3, fontSize: 14),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    // Aligns radio buttons to the start
                    children: [
                      // Option for selecting "Ayol" (Female)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGender = "Ayol"; // Select Female
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffD9E4F3), width: 1),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = "Ayol"; // Select Female
                                    });
                                  },
                                  child: Icon(
                                    _selectedGender == "Ayol"
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: _selectedGender == "Ayol"
                                        ? Colors.blue
                                        : Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Ayol",
                                  style: AppStyle.sfproDisplay18Black
                                      .copyWith(fontSize: 16),
                                ), // Label for Female
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Adds space between the two options
                      // Option for selecting "Erkak" (Male)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGender = "Erkak"; // Select Male
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Color(0xffD9E4F3), width: 1),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = "Erkak"; // Select Male
                                    });
                                  },
                                  child: Icon(
                                    _selectedGender == "Erkak"
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: _selectedGender == "Erkak"
                                        ? Colors.blue
                                        : Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Erkak",
                                  style: AppStyle.sfproDisplay18Black
                                      .copyWith(fontSize: 16),
                                ), // Label for Male
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "Tugilgan sana",
                          style: AppStyle.sfproDisplay14w400Black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _controller,
                        focusNode: tuglganfocus,
                        inputFormatters: [borndateFormatter],
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.datetime,
                        onEditingComplete: () {
                          surnameFocus.requestFocus();
                        },
                        onSubmitted: (v) {
                          surnameFocus.requestFocus();
                        },
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.date_range, color: Colors.black),
                          hintText: "25.08.1998",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
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
                            borderSide: BorderSide(
                              color: AppColor
                                  .BlueMain, // Change this to focus color
                            ),
                          ),
                        ),
                        onTap: () => _selectDate(
                            context), // Opens the date picker when tapped
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "Doimiy manzil",
                          style: AppStyle.sfproDisplay14w400Black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        focusNode: adressfocus,
                        autofocus: true,
                        style: TextStyle(
                          fontFamily: "SfProDisplay",
                          color: AppColor.Black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.name,
                        onEditingComplete: () {
                          surnameFocus.requestFocus();
                        },
                        onSubmitted: (v) {
                          surnameFocus.requestFocus();
                        },
                        decoration: InputDecoration(
                          hintText: "Kiriting...",
                          hintStyle:
                              TextStyle(color: AppColor.Gray3, fontSize: 14),
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
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _controller.text =
            "${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}";
      });
    }
  }
}
