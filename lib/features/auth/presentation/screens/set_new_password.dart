import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_assets.dart';

import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/core/validators/app_validators.dart';
import 'package:social_app/shared/widgets/app_button.dart';
import 'package:social_app/shared/widgets/app_text_field.dart';

import '../widgets/auth_top_section.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() =>
      _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState
    extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSendPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        RouteNames.signIn,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      21,
                      28,
                      21,
                      24,
                    ),
                    child: Column(
                      children: [

                        const Text(
                          'SET NEW PASSWORD',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5151C6),
                            letterSpacing: 0.3,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0FC),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Text(
                            'Type your new password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),

                        const SizedBox(height: 67),

                        AppTextField(
                          controller: _passwordController,
                          height: 60,
                          hint: 'Password',
                          obscureText: _obscurePassword,
                          suffixIcon: _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onSuffixTap: () {
                            setState(() {
                              _obscurePassword =
                                  !_obscurePassword;
                            });
                          },
                          validator: AppValidators.password, 
                        ),

                        const SizedBox(height: 18),

                        AppTextField(
                          controller: _confirmPasswordController,
                          height: 60,
                          hint: 'Confirm Password',
                          obscureText: _obscureConfirmPassword,
                          suffixIcon: _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onSuffixTap: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }

                            if (value !=
                                _passwordController.text) {
                              return 'Passwords do not match';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 35),

                        AppButton(
                          width: 300,
                          height: 45,
                          text: 'SEND',
                          isLoading: _isLoading,
                          onPressed: _onSendPressed,
                        ),

                        
                        const SizedBox(height: 60),

                        Image.asset(
                          AppAssets.diamond,
                          width: 300,
                          height: 100,
                          fit: BoxFit.contain,
                        ),

                        
                      ],
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