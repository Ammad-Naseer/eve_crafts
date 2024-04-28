import 'package:eve_crafts/utils/toast.dart';
import 'package:eve_crafts/widgets/custom_input_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/authentication_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onValidationError(String? error) {
    if (error != null) {
      Utils().toastMessage(error);
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/signup.svg',
                        width: 200, height: 200),
                    CustomInputField(
                      controller: nameController,
                      hintText: "Name",
                      prefixIcon: Icons.person,
                      onValidationError: onValidationError,
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      controller: emailController,
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      onValidationError: onValidationError,
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      controller: passwordController,
                      hintText: "Password",
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      onValidationError: onValidationError,
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      controller: confirmPasswordController,
                      abc: passwordController.text,
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock,
                      isConfirmPassword: true,
                      onValidationError: onValidationError,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthService().signUpWithEmailAndPassword(
                              emailController.text, passwordController.text);
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
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
      ),
    );
  }
}
