import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.label,
    required this.hintText,
    super.key,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      style: MyTypography.bodyMedium,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(
          label,
          style: MyTypography.bodyMedium,
        ),
        hintText: hintText,
      ),
    );
  }
}
