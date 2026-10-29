import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColor.inputBorder),
    );

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      style: const TextStyle(color: AppColor.textWhite, fontSize: 15),
      cursorColor: AppColor.primaryStart,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColor.primaryStart, fontSize: 15),
        filled: true,
        fillColor: AppColor.inputFill,
        prefix: prefixIcon,
        suffix: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColor.primaryEnd),
        ),
      ),
    );
  }
}
