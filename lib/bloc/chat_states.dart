import 'package:interview_gpt/models/chat_message.dart';
import 'package:interview_gpt/models/listing.dart';

abstract class ChatState {
  List<ChatMessage> messages;

  ChatState({required this.messages});
}

class ChatStateIdle extends ChatState {
  ChatStateIdle({required List<ChatMessage> messages})
      : super(messages: messages);
}

class ChatStateLoading extends ChatState {
  ChatStateLoading({required List<ChatMessage> messages})
      : super(messages: messages);
}

class ChatStateWithListing extends ChatState {
  List<Listing> listings;
  ChatStateWithListing(
      {required List<ChatMessage> messages, required this.listings})
      : super(messages: messages);
}
