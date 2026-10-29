import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.lable,
    required this.onPressed,
  });

  final String lable;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: AppColor.primaryGradient,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Text(
              lable,
              style: const TextStyle(
                color: AppColor.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
