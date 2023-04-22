import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat_states.dart';
import 'package:interview_gpt/models/chat_message.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(children: [
              ...state.messages
                  .map((message) => ChatMessageUI(chatMessage: message)),
              if (state is ChatStateLoading)
                ChatMessageUI(
                  chatMessage: ChatMessage(
                      content: "Loading...", role: MessageRole.assistant),
                )
            ]),
          ),
        );
      },
    );
  }
}

class ChatMessageUI extends StatelessWidget {
  const ChatMessageUI({super.key, required this.chatMessage});
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatMessage.role == MessageRole.assistant
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal,
          child: Text(chatMessage.content),
        ),
      ),
    );
  }
}
