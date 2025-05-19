import 'package:flutter/material.dart';
import 'package:pet/utils/app_theme.dart';
import 'package:pet/view_models/auth_model.dart';
import 'package:pet/view/help_widgets/my_button.dart';
import 'package:pet/view/help_widgets/my_text_field.dart';
import 'package:pet/view_models/settings_model.dart';
import 'package:provider/provider.dart';

class RegistrView extends StatelessWidget {
  const RegistrView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<SettingsModel>(context).theme;
    final model = Provider.of<AuthModel>(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary,
              colorScheme.surface,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              color: colorScheme.surface,
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.pets,
                        size: 80,
                        color: colorScheme.primary),
                    const SizedBox(height: 24),
                    Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 32),
                    MyTextField(
                      hintText: 'Email',
                      controller: model.emailController,
                      isPassword: false,
                      isConfigPassword: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      hintText: 'Пароль',
                      controller: model.passwordController,
                      isPassword: true,
                      isConfigPassword: false,
                    ),
                    const SizedBox(height: 24),
                    MyTextField(
                      hintText: 'Повторите пароль',
                      controller: model.configPasswordController,
                      isPassword: false,
                      isConfigPassword: true,
                    ),
                    const SizedBox(height: 24),
                    MyButton(
                      text: 'Зарегистрироваться',
                      callback: () => model.registerUser(context),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextButton(
                        onPressed: () => model.goBack(context),
                        child: Text(
                          'Уже есть аккаунт?',
                          style: TextStyle(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
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

