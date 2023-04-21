enum MessageRole { system, assistant, user }

class ChatMessage {
  MessageRole role;
  String content;

  ChatMessage({required this.role, required this.content});
}
