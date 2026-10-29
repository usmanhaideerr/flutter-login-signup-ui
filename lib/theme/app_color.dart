import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color bg1 = Color(0xFFB8D9EE);
  static const Color bg2 = Color(0xFF6899E3);
  static const Color bg3 = Color(0xFF1D5ACE);
  static const Color bg4 = Color(0xFF052D88);
  static const Color bg5 = Color(0xFF01133D);
  static const Color bg6 = Color(0xFF000413);

  static const Color bgNavy = bg6;

  static const Color pill = Color(0xFF161E2E);
  static const Color inputFill = Color(0xFF141B2B);

  static const Color border = Color(0xFF2A3346);
  static const Color inputBorder = Color(0xFF232C3E);

  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF9AA3B2);

  static const Color primaryStart = Color(0xFF7FD4F2);
  static const Color primaryEnd = Color(0xFF2563EB);

  static const RadialGradient backgroundGradient = RadialGradient(
    center: Alignment(0.85, -1.0),
    radius: 1.7,
    colors: [bg1, bg2, bg3, bg4, bg5, bg6],
  );

  static const RadialGradient bottomLeftGlow = RadialGradient(
    center: Alignment(-1.0, 1.0),
    radius: 1.1,
    colors: [bg4, Color(0x00052D88)],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primaryStart, primaryEnd],
  );
}
