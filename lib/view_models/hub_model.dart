import 'package:flutter/material.dart';
import 'package:pet/view/chat_view.dart';
import 'package:pet/view/notification_view.dart';
import 'package:pet/view/profile/profile_view.dart';

class HubModel extends ChangeNotifier{
  int _currentIndex = 1;
  final List<Widget> _tabs = [
    NotificationView(),
    ChatView(),
    ProfileView(),
  ];

  int get currentIndex => _currentIndex;
  List<Widget> get tabs => _tabs;


  void updateCurrentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
}