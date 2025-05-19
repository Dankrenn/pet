import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet/utils/navigation.dart';
import 'package:pet/utils/validator.dart';

class AuthModel extends ChangeNotifier {


  AuthModel();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _configPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _isLoading = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get configPasswordController => _configPasswordController;
  bool get showPassword => _showPassword;
  bool get showConfirmPassword => _showConfirmPassword;
  bool get isLoading => _isLoading;

  void _clearInfo() {
    _emailController.clear();
    _passwordController.clear();
    _configPasswordController.clear();
    _showPassword = false;
    _showConfirmPassword = false;
  }

  void setShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void setShowConfirmPassword() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  void goRegistr(BuildContext context) {
    _clearInfo();
    context.push(NavigatorRouse.register);
  }

  void goBack(BuildContext context) {
    _clearInfo();
    context.pop();
  }

  void goUpdatePassword(BuildContext context) {
    _clearInfo();
    context.go(NavigatorRouse.updatePassword);
  }

  void _goHub(BuildContext context) {
    _clearInfo();
    context.push(NavigatorRouse.hub);
  }

  Future<void> authUser(BuildContext context) async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Validator.showError(context, "Заполните все поля");
      return;
    }

    try {


      _goHub(context);
    } catch (e) {
      Validator.showError(context, Validator.parseAuthError(e.toString()));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerUser(BuildContext context) async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      Validator.showError(context, "Заполните все поля");
      return;
    }

    if (_configPasswordController.text != _passwordController.text) {
      Validator.showError(context, "Пароли не совпадают");
      return;
    }

    try {

      await authUser(context);

    } catch (e) {
      Validator.showError(context, Validator.parseAuthError(e.toString()));
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

