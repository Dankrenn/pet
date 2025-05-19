import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet/service/hive_service.dart';
import 'package:pet/utils/app_theme.dart';
import 'package:pet/utils/navigation.dart';

class SettingsModel extends ChangeNotifier{
  HiveService hiveService = HiveService();
  late bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  SettingsModel() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _isDarkMode = await hiveService.getIsDaskMode();
    notifyListeners();
  }

  Future<void> updateTheme() async {
    _isDarkMode = !_isDarkMode;
    await hiveService.setIsDaskMode(_isDarkMode);
    notifyListeners();
  }
  ThemeData get theme => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  void goBack(BuildContext context){
    context.push(NavigatorRouse.hub);
  }
}