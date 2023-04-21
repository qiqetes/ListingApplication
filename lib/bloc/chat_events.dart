abstract class ChatEvent {}

class ChatEventSend extends ChatEvent {
  String message;
  ChatEventSend({required this.message});
}
