// deepseek_service.dart — Ultra Prompt Backend 🔥
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeepSeekService {
  static const String _endpoint = 'https://your-deepseek-api-url.com/generate';

  static Future<Map<String, String>> generateUltraContent({
    required String context,
    required double flirty,
    required double funny,
    required double confident,
    required String gender,
    required String vibe,
    required String platform,
    String type = 'both',
  }) async {
    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "request_type": [type],
        "tone_settings": {
          "flirty": flirty.round(),
          "funny": funny.round(),
          "confident": confident.round()
        },
        "optional_context": context,
        "user_identity": {
          "gender": gender,
          "vibe": vibe
        },
        "platform": platform,
        "safety_filters": {
          "no_overused_phrases": true,
          "no_emoji_spam": true,
          "no_boomer_slang": true
        },
        "output_rules": {
          "max_retries": 3,
          "quality_checks": [
            "no_simpy_energy",
            "no_tryhard_vibes",
            "platform_appropriate"
          ]
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'caption': data['caption'] ?? '',
        'rizz': data['rizz'] ?? ''
      };
    } else {
      throw Exception('Failed to generate DeepSeek content');
    }
  }
}
