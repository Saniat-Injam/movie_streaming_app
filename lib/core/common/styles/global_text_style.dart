import 'package:flutter/material.dart';

// TextStyle getTextStyle({
//   double fontSize = 14.0,
//   FontWeight fontWeight = FontWeight.w400,
//   double lineHeight = 21.0,
//   TextAlign textAlign = TextAlign.center,
//   Color color = Colors.black,
// }) {
//   return GoogleFonts.poppins(
//     fontSize: fontSize.sp,
//     fontWeight: fontWeight,
//     height: fontSize.sp/ lineHeight.sp,
//     color: color,
//   );
// }

TextStyle getTextStyle({
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.w400,
  double lineHeight = 21.0,
  TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: 'HelveticaNeue',
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: fontSize / lineHeight,
    color: color,
  );
}
