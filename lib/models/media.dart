class Media {
  final String type;
  final String url;
  final String uniqueId;
  final String created;
  final int createdTime;
  final int updatedTime;
  final String createdFormatted;

  Media({
    required this.uniqueId,
    required this.type,
    required this.url,
    required this.created,
    required this.updatedTime,
    required this.createdTime,
    required this.createdFormatted,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    print("Start\n$json\nEnd");
    return Media(
        uniqueId: json["uniqueId"],
        type: json["type"],
        url: json["url"],
        created: json["created"],
        updatedTime: json["updated_time"],
        createdTime: json["created_time"],
        createdFormatted: json["created_formatted"],);
  }
}
