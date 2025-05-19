import 'package:flutter/material.dart';
import 'package:pet/data/appointment.dart';

class NotificationModel extends ChangeNotifier {
  final List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  NotificationModel() {
    //initTestData();
  }
  void initTestData() {
    _appointments.addAll([
      Appointment(
        id: '1',
        petName: 'Барсик',
        vetName: 'Др. Иванова',
        dateTime: DateTime.now().add(const Duration(days: 1)),
        clinic: 'ВетКлиника на Ленина',
        reason: 'Ежегодный осмотр и вакцинация',
        price: 2500.0,
        isConfirmed: true,
      ),
      Appointment(
        id: '2',
        petName: 'Рекс',
        vetName: 'Др. Петров',
        dateTime: DateTime.now().add(const Duration(days: 3)),
        clinic: 'ЗооЦентр',
        reason: 'Консультация по питанию',
        price: 1800.0,
        isConfirmed: false,
      ),
      Appointment(
        id: '3',
        petName: 'Мурка',
        vetName: 'Др. Сидорова',
        dateTime: DateTime.now().add(const Duration(days: 5)),
        clinic: 'КотоПес',
        reason: 'Чистка зубов',
        price: 3200.0,
        isConfirmed: true,
      ),
    ]);
    notifyListeners();
  }


}