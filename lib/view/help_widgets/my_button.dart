import 'package:flutter/material.dart';
import 'package:pet/view_models/settings_model.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final bool isFullWidth;
  final double? elevation;

  const MyButton({
    super.key,
    required this.text,
    required this.callback,
    this.isFullWidth = false,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<SettingsModel>(context).theme;
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: elevation ?? 2,
          shadowColor: colorScheme.primary.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: colorScheme.primaryContainer.withOpacity(0.5),
              width: 1,
            ),
          ),
          animationDuration: const Duration(milliseconds: 200),
          enableFeedback: true,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: colorScheme.surface,
          ),
        ),
      ),
    );
  }
}