import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


extension AddSpace on num {
  Widget spaceH() {
    return SizedBox(height: toDouble());
  }

  Widget spaceW() {
    return SizedBox(width: toDouble());
  }
}

bool isShowLike = false;



printData({required dynamic tittle, dynamic val}) {
  if (kDebugMode) {
    print("$tittle:-$val");
  }
}

extension Formatter on DateTime {
  toStringDateFormat() {
    return '$year-$month-$day';
  }
}
Widget appCommonTextSpan(
    {Color color = Colors.black,
      double size = 20,
      double? childsize,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w500,
      FontWeight childweight = FontWeight.w300,
      TextOverflow? overflow,
      int? maxLines,
      String? text,
      String? childText,
      TextDecoration? decoration}) {
  return Text.rich(
      maxLines: maxLines,
      overflow: overflow,
      TextSpan(
          text: text ?? '',
          style: GoogleFonts.workSans(
              fontSize: size,
              color: color,
              // color: isDarkMode ? Colors.white : color,
              fontWeight: weight,
              decoration: decoration),

          children: <InlineSpan>[
            TextSpan(
              text: childText ?? '',
              style: GoogleFonts.workSans(
                  fontSize: childsize ?? size,
                  color: color,
                  // color: isDarkMode ? Colors.white : color,
                  fontWeight: childweight,
                  decoration: decoration),
            )
          ]
      )
  );
}

extension AddText on String {
  Widget appCommonText(
      {Color color = Colors.black,
      double size = 20,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w500,
        TextOverflow? overflow,
        int? maxLines,
      TextDecoration? decoration}) {
    return Text(
      maxLines: maxLines,
      this,
      overflow: overflow,
      style: GoogleFonts.workSans(
          fontSize: size,
          color: color,
          // color: isDarkMode ? Colors.white : color,
          fontWeight: weight,
          decoration: decoration),
          textAlign: align,
    );
  }


  Widget appCommonTextBlack15(
      {Color color = Colors.black,
      double size = 15,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w400,
      TextDecoration? decoration,
      TextOverflow? oveflow}) {
    return Text(
      this,
      overflow: oveflow,
      style: GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: weight,
        decoration: decoration,
      ),
      textAlign: align,
    );
  }

  Widget appCommonTextBlack16(
      {Color color = Colors.black,
      double size = 16,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w400,
      TextDecoration? decoration}) {
    return Text(
      this,
      style: GoogleFonts.poppins(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decoration: decoration),
      textAlign: align,
    );
  }

  Widget lightText(
      {Color color = const Color(0XFF0D0D0D),
      num size = 14,
      FontWeight weight = FontWeight.w300,
      TextDecoration? decoration}) {
    return Text(
      this,
      style: defaultTextStyle(
          color: color, size: size, weight: weight, decoration: decoration),
      textAlign: TextAlign.center,
    );
  }
}

TextStyle defaultTextStyle(
    {Color color = const Color(0XFF9A9A9A),
    num size = 14,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration}) {
  return TextStyle(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

TextStyle hintTextStyle(
    {Color color = const Color(0XFF9A9A9A),
    num size = 14,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration}) {
  return TextStyle(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

TextStyle textFieldTextStyle(
    {Color color = const Color(0XFF0D0D0D),
    num size = 14,
    FontWeight weight = FontWeight.w500,
    TextDecoration? decoration}) {
  return TextStyle(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

const String errorText = "Something went wrong.";
const String APP_NAME = "Home Stretch";
