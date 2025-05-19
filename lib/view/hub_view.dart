import 'package:flutter/material.dart';
import 'package:pet/view_models/hub_model.dart';
import 'package:provider/provider.dart';

class HubView extends StatelessWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HubModel>(
      create: (context) => HubModel(),
      child: _DataEntryWidget(),
    );
  }
}

class _DataEntryWidget extends StatelessWidget {
  const _DataEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HubModel>(context);
    return Scaffold(
      body: model.tabs[model.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: model.currentIndex,
        onTap:(index) => model.updateCurrentIndex(index),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 24),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.notification_important),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: '',),
        ],
      ),
    );
  }
}
