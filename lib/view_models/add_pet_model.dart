import 'package:flutter/material.dart';
import 'package:pet/data/pet.dart';

class AddPetModel extends ChangeNotifier {
  String _name = '';
  String _type = 'Кошка';
  String _breed = '';
  int _age = 1;
  String _gender = 'Мужской';
  String _color = '';
  final List<String> _vaccinations = [];
  String _imageUrl = '';

  // Геттеры для полей
  String get name => _name;
  String get type => _type;
  String get breed => _breed;
  int get age => _age;
  String get gender => _gender;
  String get color => _color;
  List<String> get vaccinations => _vaccinations;
  String get imageUrl => _imageUrl;

  // Сеттеры для полей
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setType(String value) {
    _type = value;
    notifyListeners();
  }

  void setBreed(String value) {
    _breed = value;
    notifyListeners();
  }

  void setAge(int value) {
    _age = value;
    notifyListeners();
  }

  void setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  void setColor(String value) {
    _color = value;
    notifyListeners();
  }

  void addVaccination(String vaccine) {
    _vaccinations.add(vaccine);
    notifyListeners();
  }

  void removeVaccination(String vaccine) {
    _vaccinations.remove(vaccine);
    notifyListeners();
  }

  void setImageUrl(String url) {
    _imageUrl = url;
    notifyListeners();
  }

  // Метод для сохранения питомца
  Future<void> savePet(BuildContext context) async {
    if (_name.isEmpty || _breed.isEmpty || _color.isEmpty) {
      throw Exception('Заполните все обязательные поля');
    }

    final newPet = Pet(
      name: _name,
      type: _type,
      breed: _breed,
      age: _age,
      gender: _gender,
      color: _color,
      vaccinations: List.from(_vaccinations),
      imageUrl: _imageUrl,
    );

    // Здесь должна быть логика сохранения в базу данных
    // Пока просто возвращаемся назад
    Navigator.of(context).pop(newPet);
  }

  // Метод для сброса формы
  void reset() {
    _name = '';
    _type = 'Кошка';
    _breed = '';
    _age = 1;
    _gender = 'Мужской';
    _color = '';
    _vaccinations.clear();
    _imageUrl = '';
    notifyListeners();
  }
}