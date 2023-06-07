class Media {
  final String type;
  final String url;
  final String uniqueId;
  final String created;
  final int createdTime;
  final int updatedTime;
  final String createdFormatted;
  final String entityStatus;

  Media({
    required this.uniqueId,
    required this.type,
    required this.url,
    required this.entityStatus,
    required this.created,
    required this.updatedTime,
    required this.createdTime,
    required this.createdFormatted,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
        uniqueId: json["unique_id"],
        type: json["type"],
        url: json["url"],
        entityStatus: json["entityStatus"],
        created: json["created"],
        updatedTime: json["updated_time"],
        createdTime: json["created_time"],
        createdFormatted: json["created_formatted"],);
  }
}
