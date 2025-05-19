import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet/data/pet.dart';
import 'package:pet/utils/navigation.dart';

class ProfileModel extends ChangeNotifier {
  final List<Pet> pets = [
    Pet(
      name: 'Барсик',
      type: 'Кошка',
      breed: 'Британская',
      age: 3,
      gender: 'Мужской',
      color: 'Серый',
      vaccinations: ['Комплексная', 'От бешенства', 'От лишая', 'Комплексная', 'От бешенства', 'От лишая'],
      imageUrl: '',
    ),
    Pet(
      name: 'Рекс',
      type: 'Собака',
      breed: 'Лабрадор',
      age: 5,
      gender: 'Мужской',
      color: 'Золотистый',
      vaccinations: ['Комплексная', 'От бешенства', 'От клещей'],
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Labrador_on_Quantock_%282175262184%29.jpg/800px-Labrador_on_Quantock_%282175262184%29.jpg',
    ),
    Pet(
      name: 'Мурка',
      type: 'Кошка',
      breed: 'Дворовая',
      age: 2,
      gender: 'Женский',
      color: 'Трехцветная',
      vaccinations: ['Комплексная'],
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/800px-Cat_November_2010-1a.jpg',
    ),
    Pet(
      name: 'Шарик',
      type: 'Собака',
      breed: 'Овчарка',
      age: 4,
      gender: 'Мужской',
      color: 'Черно-подпалый',
      vaccinations: ['Комплексная', 'От бешенства'],
      imageUrl: '',
    ),
    Pet(
      name: 'Пушинка',
      type: 'Кошка',
      breed: 'Персидская',
      age: 1,
      gender: 'Женский',
      color: 'Белая',
      vaccinations: ['Комплексная'],
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/White_Persian_Cat.jpg/800px-White_Persian_Cat.jpg',
    ),
  ];

  Gradient getPetGradient(ColorScheme colorScheme, String petType) {
    if (petType == 'Собака') {
      // Gradient for dogs: Soft warm tones
      return LinearGradient(
        colors: [
          colorScheme.primaryContainer,
          Colors.deepOrangeAccent.shade100,
        ],
      );
    } else {
      // Gradient for cats: Soft cool tones
      return LinearGradient(
        colors: [
          colorScheme.primaryContainer,
          Colors.purple.shade200,
        ],
      );
    }
  }

  String getAgeWord(int age) {
    if (age % 10 == 1 && age % 100 != 11) return 'год';
    if (age % 10 >= 2 && age % 10 <= 4 && (age % 100 < 10 || age % 100 >= 20)) {
      return 'года';
    }
    return 'лет';
  }

  void logout(BuildContext context){
    context.go(NavigatorRouse.auth);
  }

  void goSetting(BuildContext context){
    context.push(NavigatorRouse.settings);
  }

  void goAddPet(BuildContext context){
    context.push(NavigatorRouse.addPet);
  }
}
