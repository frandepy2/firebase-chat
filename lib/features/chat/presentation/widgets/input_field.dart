import 'package:firebase_chat/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInputField extends StatefulWidget {
  final String chatId;

  const MessageInputField({super.key, required this.chatId});

  @override
  MessageInputFieldState createState() => MessageInputFieldState();
}

class MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    context.read<ChatBloc>().add(ChatEvent.sendMessage(
        text: _controller.text.trim(), chatId: widget.chatId));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Escribe un mensaje...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
