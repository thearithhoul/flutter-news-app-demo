import 'package:flutter/material.dart';
import 'package:news_custom_mobile_app/features/auth/pages/shared/login_palette.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.suffix,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final Widget? suffix;
  final ValueChanged<String>? onSubmitted;

  OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: color, width: width),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: obscureText,
      onFieldSubmitted: onSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: LoginPalette.proofBlue,
      style: const TextStyle(color: LoginPalette.ink, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffix,
        filled: true,
        fillColor: LoginPalette.field,
        floatingLabelStyle: const TextStyle(
          color: LoginPalette.ink,
          fontWeight: FontWeight.w600,
          backgroundColor: LoginPalette.marker,
        ),
        labelStyle: const TextStyle(color: LoginPalette.muted),
        errorStyle: const TextStyle(color: LoginPalette.error),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: _border(Colors.transparent, 0),
        enabledBorder: _border(Colors.transparent, 0),
        focusedBorder: _border(LoginPalette.ink, 2),
        errorBorder: _border(LoginPalette.error, 1.5),
        focusedErrorBorder: _border(LoginPalette.error, 2),
      ),
    );
  }
}
