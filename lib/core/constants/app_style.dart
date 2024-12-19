import 'dart:ui';
import 'package:doctorly/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();
  static TextStyle sfproDisplay28w600black = TextStyle(
    color: AppColor.Black,
      fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'SfProDisplay');

  static TextStyle sfProDisplay24w600 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'SfProDisplay');
  static TextStyle sfProDisplay22w600 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'SfProDisplay');
  static TextStyle sfproDisplay18Black = TextStyle(
      fontFamily: 'SfProDisplay', fontSize: 18, color: AppColor.Black);

  static TextStyle sfproDisplay18Gray5 = TextStyle(
      fontFamily: 'SfProDisplay', fontSize: 18, color: AppColor.Gray5);
  static TextStyle sfproDisplay16Gray5 = TextStyle(
      fontFamily: 'SfProDisplay', fontSize: 16, color: AppColor.Gray5);
  static TextStyle sfproDisplay16Black = TextStyle(
      fontFamily: 'SfProDisplay',fontSize: 16, color: AppColor.Black);

  static TextStyle sfproDisplay16Nonormal = TextStyle(
      fontFamily: 'SfProDisplay',fontSize: 16, color: AppColor.ColorNonrmal);
  static TextStyle sfproDisplay15Black = TextStyle(
      fontFamily: 'SfProDisplay',fontSize: 15, color: AppColor.Black,fontWeight: FontWeight.w500);

  static TextStyle sfproDisplay14w400Black = TextStyle(
      fontFamily: 'SfProDisplay',fontSize: 14, color: AppColor.Black,fontWeight: FontWeight.w400);

}
