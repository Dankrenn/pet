import 'package:flutter/material.dart';
import 'package:pet/data/chat_messenge.dart';
import 'package:provider/provider.dart';
import 'package:pet/view_models/chat_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatModel(),
      child: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChatModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Чат с ветеринаром', style:  TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: model.messages.length,
              itemBuilder: (context, index) {
                final message = model.messages.reversed.toList()[index];
                return MessageBubble(
                  message: message,
                  isMe: message.senderId == ChatModel.userId,
                );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }

}

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const MessageBubble({super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? colors.primary : colors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Text(
                      message.senderName,
                      style: textStyle.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  Text(
                    message.text,
                    style: textStyle.bodyMedium?.copyWith(
                      color: isMe ? colors.onPrimary : colors.onSurface,
                    ),
                  ),
                  Text(
                    '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                    style: textStyle.bodySmall?.copyWith(
                      color: isMe
                          ? colors.onPrimary.withOpacity(0.7)
                          : colors.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  MessageInput({super.key,});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Сообщение',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (text) {
                if (text.trim().isNotEmpty) {
                  _controller.clear();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: colorScheme.primary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}