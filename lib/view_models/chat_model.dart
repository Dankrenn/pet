import 'package:flutter/material.dart';
import 'package:pet/data/chat_messenge.dart';

class ChatModel extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  // Тестовые данные
  static const userId = 'user_123';
  static const vetId = 'vet_456';
  static const vetName = 'Доктор Иванова';

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  ChatModel() {
    _loadTestMessages();
  }

  void _loadTestMessages() {
    final now = DateTime.now();
    final List<ChatMessage> testMessages = [
      ChatMessage(
        id: '1',
        senderId: vetId,
        senderName: vetName,
        text: 'Здравствуйте! Чем могу помочь?',
        timestamp: now.subtract(const Duration(minutes: 50)),
        isRead: true,
      ),
      ChatMessage(
        id: '2',
        senderId: userId,
        senderName: 'Вы',
        text: 'Добрый день! У моего кота проблемы с аппетитом',
        timestamp: now.subtract(const Duration(minutes: 49)),
      ),
      ChatMessage(
        id: '3',
        senderId: vetId,
        senderName: vetName,
        text: 'Как давно это продолжается?',
        timestamp: now.subtract(const Duration(minutes: 48)),
      ),
      ChatMessage(
        id: '4',
        senderId: userId,
        senderName: 'Вы',
        text: 'Уже около недели',
        timestamp: now.subtract(const Duration(minutes: 47)),
      ),
      ChatMessage(
        id: '5',
        senderId: vetId,
        senderName: vetName,
        text: 'Какие еще симптомы наблюдаете?',
        timestamp: now.subtract(const Duration(minutes: 46)),
      ),
      ChatMessage(
        id: '6',
        senderId: userId,
        senderName: 'Вы',
        text: 'Стал вялым и много спит',
        timestamp: now.subtract(const Duration(minutes: 45)),
      ),
      ChatMessage(
        id: '7',
        senderId: vetId,
        senderName: vetName,
        text: 'Какая температура у кота?',
        timestamp: now.subtract(const Duration(minutes: 44)),
      ),
      ChatMessage(
        id: '8',
        senderId: userId,
        senderName: 'Вы',
        text: 'Не мерял, но нос сухой',
        timestamp: now.subtract(const Duration(minutes: 43)),
      ),
      ChatMessage(
        id: '9',
        senderId: vetId,
        senderName: vetName,
        text: 'Рекомендую измерить температуру',
        timestamp: now.subtract(const Duration(minutes: 42)),
      ),
      ChatMessage(
        id: '10',
        senderId: userId,
        senderName: 'Вы',
        text: 'Хорошо, попробую',
        timestamp: now.subtract(const Duration(minutes: 41)),
      ),
      ChatMessage(
        id: '11',
        senderId: userId,
        senderName: 'Вы',
        text: 'Температура 39.2',
        timestamp: now.subtract(const Duration(minutes: 40)),
      ),
      ChatMessage(
        id: '12',
        senderId: vetId,
        senderName: vetName,
        text: 'Это немного повышено. Давайте записаться на осмотр',
        timestamp: now.subtract(const Duration(minutes: 39)),
      ),
      ChatMessage(
        id: '13',
        senderId: userId,
        senderName: 'Вы',
        text: 'Когда можно приехать?',
        timestamp: now.subtract(const Duration(minutes: 38)),
      ),
      ChatMessage(
        id: '14',
        senderId: vetId,
        senderName: vetName,
        text: 'Сегодня после 15:00 или завтра с утра',
        timestamp: now.subtract(const Duration(minutes: 37)),
      ),
      ChatMessage(
        id: '15',
        senderId: userId,
        senderName: 'Вы',
        text: 'Приедем сегодня в 16:00',
        timestamp: now.subtract(const Duration(minutes: 36)),
      ),
      ChatMessage(
        id: '16',
        senderId: vetId,
        senderName: vetName,
        text: 'Хорошо, жду вас',
        timestamp: now.subtract(const Duration(minutes: 35)),
      ),
      ChatMessage(
        id: '17',
        senderId: userId,
        senderName: 'Вы',
        text: 'Спасибо!',
        timestamp: now.subtract(const Duration(minutes: 34)),
      ),
      ChatMessage(
        id: '18',
        senderId: vetId,
        senderName: vetName,
        text: 'Не забудьте взять с собой ветпаспорт',
        timestamp: now.subtract(const Duration(minutes: 33)),
      ),
      // Продолжаем аналогично до 50 сообщений...
      ChatMessage(
        id: '19',
        senderId: userId,
        senderName: 'Вы',
        text: 'Хорошо, возьмем',
        timestamp: now.subtract(const Duration(minutes: 32)),
      ),
      ChatMessage(
        id: '20',
        senderId: vetId,
        senderName: vetName,
        text: 'Если состояние ухудшится - звоните',
        timestamp: now.subtract(const Duration(minutes: 31)),
      ),
      ChatMessage(
        id: '21',
        senderId: userId,
        senderName: 'Вы',
        text: 'PRIVET',
        timestamp: now.subtract(const Duration(minutes: 33)),
      ),

    ];
    _messages.addAll(testMessages);
  }

  Future<void> sendMessage(String text) async {
  }

  Future<void> loadMoreMessages() async {
    // Загрузка предыдущих сообщений
    await Future.delayed(const Duration(seconds: 1));
    final olderMessages = [
      ChatMessage(
        id: '0',
        senderId: vetId,
        senderName: vetName,
        text: 'Добро пожаловать в наш сервис!',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        isRead: true,
      ),
    ];
    _messages.insertAll(0, olderMessages);
    notifyListeners();
  }
}