import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_style.dart';

Flushbar showErrorFlushBar(String text) {
  return Flushbar(
    titleText: Text("Xato !", style: GoogleFonts.zenMaruGothic(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Color(0xffd93f54),
      height: 1.2,
      letterSpacing: 0.3,
    )),
    messageText: Text(
      text,
      style: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xff1f1f1f),
      ),
    ),
    margin: EdgeInsets.all(8),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Color(0xa007bff),
    barBlur: 200,
    routeBlur: 200,
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
      Icons.error,
      color: AppColor.RedMain,
      size: 24,
    ),
    duration: const Duration(seconds: 3),
  );
}

Flushbar showSuccessFlushBar(String text) {
  return Flushbar(
    titleColor: Colors.green,
    titleText: Text("Muvaffaqiyatli", style: GoogleFonts.zenMaruGothic(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.green,
      height: 1.2,
      letterSpacing: 0.3,
    )),
    messageText: Text(
      text,
      style: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xff1f1f1f),
      ),
    ),
    margin: EdgeInsets.all(8),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Color(0xa007bff),
    barBlur: 200,
    routeBlur: 200,
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
      Icons.check,
      color: Colors.green,
      size: 24,
    ),
    duration: const Duration(seconds: 3),
  );
}
