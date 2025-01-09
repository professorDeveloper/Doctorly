import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class AddMedcardScreen extends StatefulWidget {
  const AddMedcardScreen({super.key});

  @override
  State<AddMedcardScreen> createState() => _AddMedcardScreenState();
}

class _AddMedcardScreenState extends State<AddMedcardScreen> {
  String? _selectedGender;
  var progress=false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        'Tibbiy karta ochish',
        style: AppStyle.sfproDisplay16Black,
      ),
      centerTitle: true,
    ),
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
            onPressed: () async {},
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            textColor: AppColor.White,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: progress
                ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
                : Row(
              children: [
                Spacer(),
                Text("Ochsh"),
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

      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20,),
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
          SizedBox(height: 24,),
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
          SizedBox(height: 24,),
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
          SizedBox(height: 24,),
          Row(
            children: [
              SizedBox(width: 12,),
              Text(
                'Jins',
                style: TextStyle(
                  color: Color(0xFF5E646B),
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),
            ],
          ),
          SizedBox(height: 12,),
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
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.datetime,
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
                    "Doimiy manzil",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
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

        ]),
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
