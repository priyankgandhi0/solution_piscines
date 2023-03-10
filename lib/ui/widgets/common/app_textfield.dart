import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_layout.dart';

class AppStartUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color bgColor;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showShadow;
  final bool showSuffix;
  final bool hideText;
  final bool paymentText;
  final int? maxLine;
  final int? minLine;
  final TextStyle? fontText;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final GestureTapCallback? ontap;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final bool? showCursor;
  final bool? readOnly;
  final List<TextInputFormatter>? textInputFormet;


  const AppStartUpTextField(
      {Key? key,
      required this.controller,

      this.maxLine,
      this.fontText,
      this.minLine = 1,
      this.validator,
      this.suffixIcon,
      this.bgColor = Colors.white,
      this.textInputType = TextInputType.text,
      this.textCapitalization = TextCapitalization.words,
      this.textInputAction = TextInputAction.done,
      required this.hint,
      this.prefixIcon,
      this.showShadow = false,
      this.showSuffix = false,
      this.hideText = false,
      this.paymentText = false,
      this.onSuffixTap,
      this.errorText,
      this.ontap,
      this.focusNode,
      this.onChanged,
      this.showCursor,
      this.readOnly = false, this.textInputFormet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: showCursor,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLine ?? minLine,
      onTap: ontap,
      minLines: minLine,
      focusNode: focusNode,
        inputFormatters:textInputFormet??[

        ],
        scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

      decoration: InputDecoration(

        border: startupTextFieldBorder(),
        enabledBorder: startupTextFieldBorder(),
        fillColor: bgColor,
        focusedBorder: startupTextFieldFocusBorder(),
        filled: true,
        isDense: true,
        errorText: errorText != null
            ? errorText!.trim().isEmpty
                ? null
                : errorText
            : null,
        errorStyle: GoogleFonts.poppins(fontSize: 13),
        // labelStyle: FontWeight.w300
        //     .textStyle(fontColor: ForsaColor.textFieldLabelColor),
        hintStyle:  GoogleFonts.workSans(
          color: appTextFiledColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        hintText: hint,

        prefixIcon: prefixIcon,
        /*suffixIcon: showSuffix
            ? suffixIcon ??
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: SizedBox(
                    height: hideText ? 22 : 17,
                    child: Image.asset(hideText
                        ? Assets.iconsPasswordVisibilityOff
                        : Assets.iconsPasswordVisibilityOn),
                  ),
                  onPressed: onSuffixTap,
                )
            : null,*/
      ),
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      obscureText: hideText || paymentText,
      style: GoogleFonts.poppins(),
    );
  }
}

class AppStartBigUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color bgColor;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showShadow;
  final bool showSuffix;
  final bool hideText;
  final bool paymentText;
  final int? maxLine;
  final TextStyle? fontText;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;

  const AppStartBigUpTextField({
    Key? key,
    required this.controller,
    this.maxLine,
    this.fontText,
    this.validator,
    this.suffixIcon,
    this.bgColor = Colors.white,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.done,
    required this.hint,
    this.prefixIcon,
    this.showShadow = false,
    this.showSuffix = false,
    this.hideText = false,
    this.paymentText = false,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: bgColor,
          border: Border.all(color: Colors.white),
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ]
              : null),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: 3,

        // style: ,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 10),
          fillColor: bgColor,
          border: InputBorder.none,

          // labelStyle: FontWeight.w300
          //     .textStyle(fontColor: ForsaColor.textFieldLabelColor),
          hintStyle: TextStyle(color: appTextFiledColor),
          hintText: hint,
        ),
        obscureText: hideText || paymentText,
        keyboardType: textInputType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
      ),
    );
  }
}
