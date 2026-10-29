import 'package:flutter/material.dart';
import 'package:signup_login_ui/screens/signup_screen.dart';
import 'package:signup_login_ui/theme/app_color.dart';
import 'package:signup_login_ui/widgets/app_logo.dart';
import 'package:signup_login_ui/widgets/app_text_field.dart';
import 'package:signup_login_ui/widgets/auth_footer.dart';
import 'package:signup_login_ui/widgets/auth_scaffold.dart';
import 'package:signup_login_ui/widgets/gradient_button.dart';
import 'package:signup_login_ui/widgets/or_divider.dart';
import 'package:signup_login_ui/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    // TODO: validate credentials and authenticate the user, then route to the
    // app's home screen on success.
  }

  void _onGoogle() {
    // TODO: trigger Google OAuth sign-in.
  }

  void _onApple() {
    // TODO: trigger Apple sign-in.
  }

  void _onForgotPassword() {
    // TODO: navigate to the password-reset flow.
  }

  void _gotoSignUp() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 130),
          const Center(child: AppLogo()),
          const Spacer(flex: 5),

          const Text(
            'Hi There',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.textWhite,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            'Please enter required details',
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

          const OrDivider(lable: ''),
          const SizedBox(height: 20),

          AppTextField(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 14),
          AppTextField(
            controller: _emailController,
            hintText: 'Password',
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColor.textMuted,
                size: 20,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          const SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _onForgotPassword,
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColor.textMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          GradientButton(lable: 'Log in', onPressed: _onLogin),
          const SizedBox(height: 24),
          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Create an account?  ',
                    style: TextStyle(color: AppColor.textMuted, fontSize: 14),
                  ),

                  GestureDetector(
                    onTap: _gotoSignUp,
                    child: const Text(
                      'Sign Up',
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

          const Spacer(flex: 4),
          const Center(child: AuthFooter()),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
