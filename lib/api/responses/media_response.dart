import "../../models/media.dart";

class MediaResponse {
  final Media media;
  final String? error;
  final String? sessionToken;

  MediaResponse({
    required this.media,
    required this.error,
    required this.sessionToken,
  });

  factory MediaResponse.fromJson(Map<String, dynamic> json) {
    return MediaResponse(
        media: Media.fromJson(json["media"]),
        error: json["error"],
        sessionToken: json["error"],);
  }
}
