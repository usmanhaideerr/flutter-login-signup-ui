import 'package:flutter/material.dart';
import 'package:signup_login_ui/screens/login_screen.dart';
import 'package:signup_login_ui/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haidly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.bgNavy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryEnd,
          brightness: Brightness.dark,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
