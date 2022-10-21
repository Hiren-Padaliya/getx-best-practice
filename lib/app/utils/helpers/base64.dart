
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

String setBase64(){
  String username = dotenv.get('USERNAME');
  String pass = dotenv.get('PASSWORD');
  // String base64=(username+':'+pass);

  String text = (username+':'+pass);
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String encoded = stringToBase64.encode(text);
  print('base64: $encoded');
  return encoded;
}

