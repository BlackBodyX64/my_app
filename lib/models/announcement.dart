import 'package:json_annotation/json_annotation.dart';

part 'announcement.g.dart';

@JsonSerializable()
class Announcement {
  Announcement(
    this.id,
    this.cover,
    this.title,
    this.description,
    this.html,
    this.announcementType,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
  );

  final String id, cover, title, description, html, announcementType;
  final bool isPublic;
  final DateTime createdAt, updatedAt;

  factory Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}
