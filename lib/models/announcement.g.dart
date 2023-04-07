// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      json['id'] as String,
      json['cover'] as String,
      json['title'] as String,
      json['description'] as String,
      json['html'] as String,
      json['announcementType'] as String,
      json['isPublic'] as bool,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'title': instance.title,
      'description': instance.description,
      'html': instance.html,
      'announcementType': instance.announcementType,
      'isPublic': instance.isPublic,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
