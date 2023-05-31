import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:salamanca/models/chat_model.dart';

import '../constants/api_constants.dart';
import 'package:http/http.dart' as http;

class APIservice {
  static Future<List<SaulModel>> saulGPT({required String userPrompt}) async {
    try {
      //logic
      Map<String, String> apiHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $API_TOKEN'
      };
      final apiBody = jsonEncode({
        "model": "text-davinci-003", // can be upgraded as needed
        "prompt": userPrompt,
        "max_tokens": 100,
        "temperature": 0
      });

      var response = await http.post(Uri.parse("$BASE_URL/completions"),
          headers: apiHeaders, body: apiBody);

      Map readableResponse = jsonDecode(response.body);

      if (readableResponse['error'] != null) {
        log('ERROR ${readableResponse['error']['message']}');
        throw HttpException(readableResponse['error']['message']);
      }
      List<SaulModel> chatList = [];
      if (readableResponse['choices'].length > 0) {
        log('JSON Response ---> ${readableResponse['choices'][0]['text']}');
        chatList = List.generate(
          readableResponse['choices'].length,
          (index) => SaulModel(
              msg: readableResponse['choices'][index]['text'], chatIndex: 1),
        );
      }
      return chatList;
    } catch (e) {
      log('$e');
      rethrow;
    }
  }
}
