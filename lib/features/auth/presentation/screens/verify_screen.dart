import 'package:flutter/material.dart';

import 'package:social_app/core/constants/app_assets.dart';
import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/shared/widgets/app_button.dart';
import 'package:social_app/shared/widgets/app_text_field.dart';

import '../widgets/auth_top_section.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _codeController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _onVerifyPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
     
      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        RouteNames.selectcategory,
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

  void _onResendCodePressed() {
    
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
                        const SizedBox(height: 15),

                        const Text(
                          'VERIFICATION',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
                            'A message with verification code\n'
                            'was sent to your mobile phone.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF090909),
                              height: 1.4,
                            ),
                          ),
                        ),

                        const SizedBox(height: 26),

                        AppTextField(
                          controller: _codeController,
                          height: 50,
                          hint: 'Type verification code',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),

                        const SizedBox(height: 30),

                        GestureDetector(
                          onTap: _onResendCodePressed,
                          child: const Text(
                            "DON'T RECEIVE THE CODE",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 16, 16, 17),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        AppButton(
                          width: 300,
                          height: 50,
                          text: 'VERIFY',
                          isLoading: _isLoading,
                          onPressed: _onVerifyPressed,
                        ),

                        const SizedBox(height: 90),

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