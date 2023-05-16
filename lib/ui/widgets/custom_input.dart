import 'package:flutter/material.dart';

import '../../shared/app_theme.dart';

class CustomInput extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  const CustomInput({
    super.key,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.name,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppTheme.defaultRadius,
          ),
        ),
      ),
    );
  }
}
