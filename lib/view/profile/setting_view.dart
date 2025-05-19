import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/view_models/settings_model.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsModel>(context);
    final colorScheme = model.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        leading: IconButton(
          onPressed: () => model.goBack(context),
          icon: Icon(Icons.arrow_back_outlined),
          color: colorScheme.onPrimary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ThemeWidget(),
          ],
        ),
      ),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsModel>(context);
    final colorScheme = Provider.of<SettingsModel>(context).theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ночная тема",
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
        CupertinoSwitch(
          value: model.isDarkMode,
          onChanged: (value) => model.updateTheme(),
          activeColor: colorScheme.secondary,
          trackColor: colorScheme.onSurface,
        ),
      ],
    );
  }
}
