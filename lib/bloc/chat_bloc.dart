import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat_events.dart';
import 'package:interview_gpt/bloc/chat_states.dart';
import 'package:interview_gpt/models/chat_message.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatStateIdle(messages: [])) {
    on<ChatEventSend>(_onChatEventSend);
  }

  void _onChatEventSend(ChatEventSend event, Emitter<ChatState> emit) async {
    emit(ChatStateLoading(messages: [
      ...state.messages,
      ChatMessage(content: event.message, role: MessageRole.user)
    ]));

    await Future.delayed(const Duration(seconds: 1));

    emit(ChatStateIdle(messages: [
      ...state.messages,
      ChatMessage(content: "recibido", role: MessageRole.assistant)
    ]));
  }
}
