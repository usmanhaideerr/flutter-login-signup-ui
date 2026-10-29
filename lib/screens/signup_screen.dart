import 'package:flutter/material.dart';
import 'package:signup_login_ui/theme/app_color.dart';
import 'package:signup_login_ui/widgets/app_logo.dart';
import 'package:signup_login_ui/widgets/app_text_field.dart';
import 'package:signup_login_ui/widgets/auth_footer.dart';
import 'package:signup_login_ui/widgets/auth_scaffold.dart';
import 'package:signup_login_ui/widgets/gradient_button.dart';
import 'package:signup_login_ui/widgets/or_divider.dart';
import 'package:signup_login_ui/widgets/social_button.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters long.'),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Validation successful. Connect your signup service.'),
      ),
    );
  }

  void _onGoogle() {
    // TODO: Implement Google sign-up.
  }

  void _onApple() {
    // TODO: Implement Apple sign-up.
  }

  void _gotoLogin() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80),

          const Center(child: AppLogo()),

          const Spacer(flex: 2),

          const Text(
            'Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.textWhite,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Sign up to get started',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.textMuted,
              fontSize: 16,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: SocialButton(
                  label: 'Google',
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 20,
                    width: 20,
                  ),
                  onPressed: _onGoogle,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: SocialButton(
                  label: 'Apple',
                  icon: const Icon(
                    Icons.apple,
                    color: AppColor.textWhite,
                    size: 22,
                  ),
                  onPressed: _onApple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const OrDivider(lable: 'OR'),

          const SizedBox(height: 20),

          AppTextField(
            controller: _nameController,
            hintText: 'Full Name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 14),

          AppTextField(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 14),

          AppTextField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.next,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColor.textMuted,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),

          const SizedBox(height: 14),

          AppTextField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: _obscureConfirmPassword,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColor.textMuted,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),

          const SizedBox(height: 24),

          GradientButton(lable: 'Create Account', onPressed: _onSignUp),

          const SizedBox(height: 24),

          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(color: AppColor.textMuted, fontSize: 14),
                  ),

                  GestureDetector(
                    onTap: _gotoLogin,
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: AppColor.textWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(flex: 2),

          const Center(child: AuthFooter()),

          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
