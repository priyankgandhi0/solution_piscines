import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/extensions.dart';


class AppButton extends StatelessWidget {
  final Function() onPress;
  final double height;
  final double borderValue;
  final String text;
  final bool visible;
  final Color? buttonColor;

  const AppButton({
    Key? key,
    required this.onPress,
    this.visible = false,
    required this.borderValue,
    this.height = 50,
    this.buttonColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderValue),
        color: buttonColor ?? appColor,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor?? appColor),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderValue),
          )),
        ),
        onPressed: () {
          onPress();
        },
        child: Center(
          child: Text(text,
              style: GoogleFonts.workSans(
                  color: Colors.white,  fontWeight: FontWeight.w500,fontSize: 20)),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double value;
  final Color? appButtonColor;
  final Color? appFillColor;
  final Color? appTextFillColor;
  final Color? appBorderFillColor;

  const BorderButton({
    Key? key,
    required this.text,
    this.appButtonColor,
    this.appFillColor,
    this.appTextFillColor,
    this.appBorderFillColor,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(appFillColor ?? Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(value),
            side: BorderSide(color: appBorderFillColor ?? Colors.white))),
      ),
      onPressed: () {
        onTap();
      },
      child: Center(
        child: Text(text,
            style: GoogleFonts.workSans(
                color: appTextFillColor ?? appColor,
                fontSize: 20,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}

class SubTextButton extends StatelessWidget {
  final Widget appWidget;
  final VoidCallback onTap;

  const SubTextButton({
    Key? key,
    required this.appWidget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: appWidget,
    );
  }
}
