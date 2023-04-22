import 'dart:math';

import 'package:interview_gpt/constants.dart';

enum MessageRole { system, assistant, user }

class ChatMessage {
  late MessageRole role;
  late String content;

  ChatMessage({required this.role, required this.content});

  ChatMessage.fromNonListingReply(String reply) {
    role = MessageRole.assistant;
    if (!reply.contains("ERROR")) {
      content = reply;
      return;
    }
    content = ERROR_MESSAGES.elementAt(Random().nextInt(ERROR_MESSAGES.length));
  }
}
