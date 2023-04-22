import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/bloc/chat_events.dart';
import 'package:interview_gpt/bloc/chat_states.dart';
import 'package:interview_gpt/models/chat_message.dart';
import 'package:interview_gpt/models/listing.dart';
import 'package:interview_gpt/repository/gpt_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatStateIdle(messages: [])) {
    on<ChatEventSend>(_onChatEventSend);
  }

  void _onChatEventSend(ChatEventSend event, Emitter<ChatState> emit) async {
    emit(ChatStateLoading(messages: [
      ...state.messages,
      ChatMessage(content: event.message, role: MessageRole.user)
    ]));

    try {
      String reply = await GptRepository.sendMessage(event.message);

      if (isReplyValidListingFormat(reply)) {
        List<Listing> listings = fromReplyToListingList(reply);
        return emit(ChatStateWithListing(messages: [], listings: listings));
      }

      // Handle error replies
      var assistantMessage = ChatMessage.fromNonListingReply(reply);
      emit(ChatStateIdle(messages: [...state.messages, assistantMessage]));
    } catch (e) {
      emit(ChatStateIdle(messages: [
        ...state.messages,
        ChatMessage(
            content: "Error, comprueba tu internet",
            role: MessageRole.assistant)
      ]));
    }
  }
}
