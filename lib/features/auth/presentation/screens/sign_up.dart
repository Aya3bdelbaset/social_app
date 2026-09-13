import 'package:flutter/material.dart';

import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/core/validators/app_validators.dart';
import 'package:social_app/shared/widgets/app_button.dart';
import 'package:social_app/shared/widgets/app_text_field.dart';

import '../widgets/auth_top_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _onSignUpPressed() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      
      if (!mounted) return;

      Navigator.pushNamed(
        context,
        RouteNames.verify,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _onSignInPressed() {
    Navigator.pushNamed(
      context,
      RouteNames.signIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthTopSection(
                imagePath: 'assets/images/authpic.png',
                height: 260,
              ),

              Transform.translate(
                offset: const Offset(0, -30),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        21,
                        28,
                        21,
                        24,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),

                          AppTextField(
                            controller: _emailController,
                            height: 60,
                            hint: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: AppValidators.email, 
                          ),

                          const SizedBox(height: 18),

                          AppTextField(
                            controller: _confirmEmailController,
                            height: 60,
                            hint: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: AppValidators.email, 
                          ),

                          const SizedBox(height: 18),

                          AppTextField(
                            controller: _passwordController,
                            height: 60,
                            hint: 'Password',
                            obscureText: _obscurePassword,
                            suffixIcon: _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            onSuffixTap: _togglePasswordVisibility,
                            validator: AppValidators.password, 
                          ),

                          const SizedBox(height: 35),

                          AppButton(
                            width: 300,
                            height: 45,
                            text: 'SIGN UP',
                            isLoading: _isLoading,
                            onPressed: _onSignUpPressed,
                          ),

                          const SizedBox(height: 48),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF55555F),
                                ),
                              ),
                              GestureDetector(
                                onTap: _onSignInPressed,
                                child: const Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5151C6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}