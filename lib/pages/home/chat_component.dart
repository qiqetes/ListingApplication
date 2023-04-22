import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_bloc.dart';
import 'package:interview_gpt/bloc/chat/chat_events.dart';
import 'package:interview_gpt/bloc/chat/chat_states.dart';
import 'package:interview_gpt/constants.dart';
import 'package:interview_gpt/models/chat_message.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ccPale,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const _ChatList(),
            ChatInput(),
          ],
        ),
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  const _ChatList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (_, state) {
        return Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(children: [
              ...state.messages
                  .map((message) => ChatMessageUI(chatMessage: message)),
              if (state is ChatStateLoading)
                ChatMessageUI(
                  chatMessage: ChatMessage(
                    content: "Loading...",
                    role: MessageRole.assistant,
                  ),
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: chatMessage.role == MessageRole.assistant ? ccGreen : ccBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              Text(chatMessage.content, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  void onPress(BuildContext context) {
    if (_controller.text.length < 5) return;
    context.read<ChatBloc>().add(ChatEventSend(message: _controller.text));
    _controller.text = "";
  }

  final TextEditingController _controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
        decoration: BoxDecoration(
          color: ccRed,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (_) => onPress(context),
                controller: _controller,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Ask me!'),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return IconButton(
                  onPressed:
                      state is ChatStateLoading ? null : () => onPress(context),
                  icon: const Icon(Icons.send),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
