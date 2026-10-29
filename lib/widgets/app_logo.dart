import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 58});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/haidly_logo.png',
      height: height,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) =>
          FallbackWordmark(height: height),
    );
  }
}

class FallbackWordmark extends StatelessWidget {
  const FallbackWordmark({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bolt, color: AppColor.textWhite, size: height),
        const SizedBox(width: 6),
        Text(
          'Haidly',
          style: TextStyle(
            color: AppColor.textWhite,
            fontSize: height * 0.9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}