import 'package:flutter/material.dart';

import 'package:social_app/core/routes/route_names.dart';
import 'package:social_app/core/validators/app_validators.dart';
import 'package:social_app/shared/widgets/app_button.dart';
import 'package:social_app/shared/widgets/app_text_field.dart';

import '../widgets/auth_top_section.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _onLoginPressed() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, RouteNames.home);
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

  void _onGoogleLoginPressed() {
   
  }

  void _onFacebookLoginPressed() {
    
  }

  void _onForgotPasswordPressed() {
    Navigator.pushNamed(context, RouteNames.forgotPassword);
  }

  void _onSignUpPressed() {
    Navigator.pushNamed(context, RouteNames.signUp);
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
                      padding: const EdgeInsets.fromLTRB(21, 28, 21, 24),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
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
                            controller: _passwordController,
                            hint: 'Password',
                            obscureText: _obscurePassword,
                            suffixIcon: _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            onSuffixTap: _togglePasswordVisibility,
                            validator: AppValidators.password, 
                          ),

                          const SizedBox(height: 28),

                          
                          TextButton(
                            onPressed: _onForgotPasswordPressed,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'FORGOT PASSWORD',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.8,
                                color: Color(0xFF5151C6),
                              ),
                            ),
                          ),

                          const SizedBox(height: 39),

                         
                          AppButton(
                            width: 300,
                            height: 45,
                            
                            isLoading: _isLoading,
                            onPressed: _onLoginPressed,
                            text: 'LOG IN',
                          ),

                          const SizedBox(height: 50),

                         
                          const Text(
                            'OR LOG IN BY',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF777783),
                              letterSpacing: 0.5,
                            ),
                          ),

                          const SizedBox(height: 14),

                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialButton(
                                onTap: _onGoogleLoginPressed,
                                child: const Text(
                                  'G',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5151C6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
                              _SocialButton(
                                onTap: _onFacebookLoginPressed,
                                child: const Icon(
                                  Icons.facebook,
                                  size: 19,
                                  color: Color(0xFF5151C6),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 37),

                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF55555F),
                                ),
                              ),
                              GestureDetector(
                                onTap: _onSignUpPressed,
                                child: const Text(
                                  'SIGN UP',
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

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xFFE9E9FC),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
