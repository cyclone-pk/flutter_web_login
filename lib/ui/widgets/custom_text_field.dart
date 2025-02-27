import 'package:flutter/material.dart';
import 'package:flutter_web_login_screen/style/color.dart';
import 'package:flutter_web_login_screen/style/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLine;
  final bool required;
  final bool showLabel;
  final bool readOnly;
  final bool password;
  final double verticalPadding;
  final TextInputType inputType;
  final Function? onValidate;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.required = false,
    this.maxLine,
    this.readOnly = false,
    this.verticalPadding = 13,
    this.inputType = TextInputType.text,
    this.onValidate,
    this.showLabel = false,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      style: CustomTextStyle.regular
          .copyWith(fontWeight: FontWeight.w600, color: CustomTheme.black),
      cursorColor: Colors.black,
      cursorHeight: 12,
      obscureText: password,
      validator: (v) {
        if (v!.isEmpty && required) return "$hintText is required*";
        if (onValidate != null) return onValidate!();
        return null;
      },
      readOnly: readOnly,
      keyboardType: inputType,
      decoration: InputDecoration(
          labelText: showLabel ? hintText : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: CustomTheme.black.withValues(alpha: .1),
                width: .5), // Removes border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: CustomTheme.accentColor, width: 1.5), // Removes border
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: CustomTheme.white, width: 1), // Removes border
          ),
          filled: true,
          fillColor: CustomTheme.textField,
          hintStyle: CustomTextStyle.regular
              .copyWith(color: CustomTheme.black.withValues(alpha: .5)),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: verticalPadding),
          hintText: hintText),
    );
  }
}
