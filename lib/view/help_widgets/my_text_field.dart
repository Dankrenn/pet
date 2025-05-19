import 'package:flutter/material.dart';
import 'package:pet/view_models/auth_model.dart';
import 'package:provider/provider.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isConfigPassword;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    required this.isConfigPassword,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = Provider.of<AuthModel>(context);

    return TextField(
      controller: controller,
      obscureText: isPassword
          ? model.showPassword
          : isConfigPassword
          ? model.showConfirmPassword
          : false,
      style: TextStyle(
        color: theme.colorScheme.onSurface,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: theme.colorScheme.onSurface,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        suffixIcon: isPassword
            ? IconButton(
          onPressed: model.setShowPassword,
          icon: Icon(
            model.showPassword ? Icons.visibility_off : Icons.visibility,
            color: theme.colorScheme.primary,
          ),
        )
            : isConfigPassword
            ? IconButton(
          onPressed: model.setShowConfirmPassword,
          icon: Icon(
            model.showConfirmPassword
                ? Icons.visibility_off
                : Icons.visibility,
            color: theme.colorScheme.primary,
          ),
        )
            : null,
      ),
    );
  }
}



