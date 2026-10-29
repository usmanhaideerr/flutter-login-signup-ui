import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.lable});
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColor.border, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            lable,
            style: const TextStyle(color: AppColor.textMuted, fontSize: 13),
          ),
        ),
        const Expanded(child: Divider(color: AppColor.border, thickness: 1)),
      ],
    );
  }
}
