import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';

class RoundedTextFormField extends StatelessWidget {
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  Function(String)? onChanged;
  Icon? icon;
  TextInputType? textInputType;
  InputBorder? errorBorder;
  VoidCallback? onTap;
  bool? enable;
  bool? obscureText;
  bool? readOnly;

  // final Colors color;
  IconData? iconData;
  RoundedTextFormField({
    required this.labelText,
    this.validator,
    required this.controller,
    this.onTap,
    this.icon,
    this.iconData,
    this.textInputType,
    this.enable,
    this.onChanged,
    this.errorBorder,
    this.obscureText = false,
    this.readOnly = false,
    // required this.color,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText!,
      readOnly: readOnly!,
      style: TextStyle(color: ColorConstant.red200),
      keyboardType: textInputType,
      onTap: onTap,
      // onChanged: onChanged,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(iconData),
            onPressed: () {},
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: ColorConstant.red200,
          ),
          errorBorder: errorBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(
              color: ColorConstant.red200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(
              color: ColorConstant.red200,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(
              color: ColorConstant.red200,
              width: 1.0,
            ),
          )),
    );
  }
}
