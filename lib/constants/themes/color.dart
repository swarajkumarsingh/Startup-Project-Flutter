import 'package:flutter/material.dart';

// Global Color Variables
const Color kTextFieldColor = Color.fromRGBO(243, 240, 240, 1);
const Color kPrimaryColor = Color.fromRGBO(31, 201, 195, 1);
const Color kStarColor = Color.fromRGBO(180, 107, 14, 1);
const Color kTextColor = Color(0xFF0D1333);
const Color kBestSellerColor = Color(0xFFFFD073);
const Color kGreenColor = Color(0xFF49CC96);
const Color darkText = Color(0xFF253840);
const Color darkerText = Color(0xFF17262A);
const Color lightText = Color(0xFF4A6572);
const String fontName = 'WorkSans';

// Gradients
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);


// Custom Shadow
List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: const Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: Colors.black54.withOpacity(.2),
      spreadRadius: 2,
      offset: const Offset(7, 7),
      blurRadius: 20)
];

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
