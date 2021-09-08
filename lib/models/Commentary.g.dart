// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Commentary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentary _$CommentaryFromJson(Map<String, dynamic> json) {
  return Commentary(
    description: json['description'] as String,
    score: json['score'] as String,
    userName: json['userName'] as String
  );
}

Map<String, dynamic> _$CommentaryToJson(Commentary instance) =>
    <String, dynamic>{
      'description': instance.description,
      'score': instance.score,
      'userName': instance.userName
    };
