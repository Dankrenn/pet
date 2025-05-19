import 'package:flutter/material.dart';

class Validator {

  static void showError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static String parseAuthError(String error) {
    if (error.contains('Invalid credentials')) {
      return 'Неверный email или пароль';
    } else if (error.contains('User already exists')) {
      return 'Пользователь с таким email уже существует';
    } else if (error.contains('password')) {
      return 'Пароль должен содержать минимум 8 символов';
    } else if (error.contains('email')) {
      return 'Введите корректный email';
    } else {
      print(error);
      return 'Произошла ошибка. Попробуйте позже';
    }
  }
}
