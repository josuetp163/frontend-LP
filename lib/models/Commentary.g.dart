// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Commentary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentary _$CommentaryFromJson(Map<String, dynamic> json) {
  return Commentary(
    id: json['id'] as int?,
    description: json['description'] as String,
    score: json['score'] as String,
    userName: json['userName'] as String,
    spot: Spot.fromJson(json['spot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentaryToJson(Commentary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'score': instance.score,
      'userName': instance.userName,
      'spot': instance.spot,
    };
