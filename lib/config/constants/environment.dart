

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String theCatApiKey = dotenv.env['x-apy-key'] ?? 'Not Api Key';
  
}