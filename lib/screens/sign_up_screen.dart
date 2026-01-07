import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson/core/utils/validators/app_validator.dart';

class SignUpScreen extends StatefulWidget {
  final Function(bool)? onThemeChanged;

  const SignUpScreen({super.key, this.onThemeChanged});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  widget.onThemeChanged?.call(value);
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width > 600 ? 60.0 : 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo_login.svg',
                    height: width > 600 ? 200 : 150,
                    width: width > 600 ? 200 : 150,
                  ),
                  SizedBox(height: width > 600 ? 50 : 35),
                  Text(
                    'WELCOME TO LESSON 12\n    after login LESSON 13',
                    style: TextStyle(
                      fontSize: width > 600 ? 30 : 25,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: width > 600 ? 40 : 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _InputField(
                          controller: _emailController,
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          validator: AppValidator.emailValidate,
                        ),
                        SizedBox(height: width > 600 ? 30 : 20),
                        _InputField(
                          controller: _passwordController,
                          hintText: "Пароль",
                          prefixIcon: const Icon(Icons.lock),
                          obscure: hidePassword,
                          validator: AppValidator.passwordValidate,
                          suffix: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: width > 600 ? 40 : 30),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              log("Form is validated", name: "Form");
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              vertical: width > 600 ? 12 : 8,
                              horizontal: width > 600 ? 70 : 50,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: width > 600 ? 24 : 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.controller,
    this.suffix,
    this.obscure = false,
  });

  final String hintText;
  final Widget prefixIcon;
  final Widget? suffix;
  final bool obscure;
  final String? Function(String?) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
