import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_gpt/.secret.dart';

class ImgRepository {
  static const String _baseUrl = "https://api.pexels.com/v1/search";

  static Future<String> getImgUrl(String query) async {
    var headers = {
      'Authorization': API_KEY_PEXELS,
    };

    final response = await http.get(
      Uri.parse(_baseUrl).replace(queryParameters: {
        'query': query,
        'per_page': '1',
      }),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> resMap = jsonDecode(response.body);
      String imgUrl = resMap['photos'][0]['src']['medium'];

      return imgUrl;
    } else {
      throw Exception('Failed to get image.');
    }
  }
}
