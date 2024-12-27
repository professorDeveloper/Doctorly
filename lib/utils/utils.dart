import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String convertPhoneNumber(String input) {
  String result = input.replaceAll(RegExp(r'[^0-9]'), '');

  return "+"+result;
}
String formatPhoneNumber(String phoneNumber) {
  // Remove the "+" at the beginning, if present
  phoneNumber = phoneNumber.replaceAll("+", "");

  // Reformat the string
  return "${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 5)} ${phoneNumber.substring(5, 8)} ${phoneNumber.substring(8, 10)} ${phoneNumber.substring(10)}";
}

// final List<Widget> screens = [
//   HomeScreen(),
//   CategoriesScreen(),
//   ShortsScreen(),
//   TvScreen(),
//   EditProfileScreen(),
//   ProfileScreen(),
// ];

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
  GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}