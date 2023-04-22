import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_gpt/.secret.dart';
import 'package:interview_gpt/constants.dart';

class GptRepository {
  static Future<String> sendMessage(String userMessage) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $API_KEY_GPT'
    };

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": PROMPT_SYSTEM},
            {"role": "user", "content": userMessage},
          ]
        },
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson['choices'][0]['message']['content'];
    }

    throw Exception("Couldn't connect with chatGptApi");
  }
}
