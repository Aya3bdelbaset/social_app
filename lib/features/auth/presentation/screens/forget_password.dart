import 'package:flutter/material.dart';
import 'package:social_app/core/constants/app_assets.dart';

import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/core/validators/app_validators.dart';
import 'package:social_app/shared/widgets/app_button.dart';
import 'package:social_app/shared/widgets/app_text_field.dart';

import '../widgets/auth_top_section.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSendPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      
      if (!mounted) return;

      Navigator.pushNamed(context, RouteNames.setNewPassword);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
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
                    padding: const EdgeInsets.fromLTRB(21, 28, 21, 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),

                        const Text(
                          'TYPE YOUR EMAIL',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5151C6),
                            letterSpacing: 0.3,
                          ),
                        ),

                        const SizedBox(height: 15),

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
                            'We will send you instruction on\n'
                        
                            'how to reset your password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                              height: 1.4,
                            ),
                          ),
                        ),

                        const SizedBox(height: 38),

                        AppTextField(
                          controller: _emailController,
                          height: 60,
                          
                          hint: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          validator: AppValidators.email,
                        ),

                        const SizedBox(height: 80),

                        AppButton(
                          width: 300,
                          height: 45,
                          text: 'SEND',
                          isLoading: _isLoading,
                          onPressed: _onSendPressed,
                        ),

                        const SizedBox(height: 80),
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
