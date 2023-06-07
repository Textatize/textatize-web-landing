import "dart:convert";

import "package:textatize_landing/api/responses/media_response.dart";
import "package:http/http.dart" as http;

class TextatizeApi {
  static const String host = "devapi.textatizeapp.com";
  static const String url = "";

  Future<MediaResponse> getMedia(String mediaId) async {
    try {
      final response = await http.get(
        Uri.https(host, "${url}public/media/$mediaId"),
      );
      if (jsonDecode(utf8.decode(response.bodyBytes))["error"] != null) {
        throw jsonDecode(utf8.decode(response.bodyBytes))["error"];
      }
      return MediaResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
