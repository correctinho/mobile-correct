import 'dart:convert';
import 'dart:typed_data';

class Base64Converter {
  static String encode(Uint8List image) {
    return base64Encode(image);
  }

  static Uint8List decode(String base64String) {
    return base64Decode(base64String);
  }
}
