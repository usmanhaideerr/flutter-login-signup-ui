import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _FooterLink(label: 'Terms of service', onTap: () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '|',
              style: TextStyle(color: AppColor.textMuted, fontSize: 12),
            ),
          ),

          _FooterLink(label: 'Privacy policy', onTap: (){}),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColor.textMuted,
          fontSize: 12,
          decoration: TextDecoration.underline,
          decorationColor: AppColor.textMuted,
        ),
      ),
    );
  }
}
