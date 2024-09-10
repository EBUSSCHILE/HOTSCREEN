// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../config/app_config.dart';

class ClaudeService {
  // Comentamos estas líneas por ahora
  // static const String _baseUrl = AppConfig.claudeApiUrl;
  // static const Map<String, String> _headers = {
  //   'Content-Type': 'application/json',
  //   'x-api-key': AppConfig.claudeApiKey,
  // };

  static Future<String> sendMessage(String message) async {
    // Implementación temporal
    return "Respuesta temporal de Claude";

    // Comentamos el resto de la función por ahora
    // final response = await http.post(
    //   Uri.parse('$_baseUrl/v1/messages'),
    //   headers: _headers,
    //   body: json.encode({
    //     'prompt': message,
    //     'max_tokens_to_sample': 300,
    //     'temperature': 0.5,
    //   }),
    // );

    // if (response.statusCode == 200) {
    //   final jsonResponse = json.decode(response.body);
    //   return jsonResponse['completion'] as String;
    // } else {
    //   throw Exception('Failed to send message to Claude API');
    // }
  }
}