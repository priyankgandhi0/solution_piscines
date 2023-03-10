import 'package:flutter/material.dart';

import 'app_colors.dart';

OutlineInputBorder startupTextFieldBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      gapPadding: 0,
      borderSide: const BorderSide(color: Colors.white));
}

OutlineInputBorder startupTextFieldFocusBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      gapPadding: 0,
      borderSide: BorderSide(color: appColor));
}

Border boxBorder([Color? strokeColor]) {
  return Border.all(
    color: strokeColor ?? Colors.white,
    width: 1,
  );
}

List<BoxShadow> boxShadow() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 5,
      offset: const Offset(0, 2),
    ),
  ];
}
