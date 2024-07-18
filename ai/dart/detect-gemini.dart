// ruleid: detect-gemini
import 'package:google_generative_ai/google_generative_ai.dart';

// Access your API key as an environment variable (see "Set up your API key" above)
final apiKey = Platform.environment['API_KEY'];
if (apiKey == null) {
  print('No \$API_KEY environment variable');
  exit(1);
}

// ruleid: detect-gemini
final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);