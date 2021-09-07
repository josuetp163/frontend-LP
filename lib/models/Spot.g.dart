// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spot _$SpotFromJson(Map<String, dynamic> json) {
  return Spot(
    id: json['id'] as int?,
    image: json['image'] as String,
    spotName: json['spotName'] as String,
    description: json['description'] as String,
    city: json['city'] as String,
    enable: json['enable'] as bool,
    locationX: json['locationX'] as double,
    locationY: json['locationX'] as double,
  );
}

Map<String, dynamic> _$SpotToJson(Spot instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'spotName': instance.spotName,
      'description': instance.description,
      'city': instance.city,
      'enable': instance.enable,
      'x': instance.locationX,
      'y': instance.locationY,
    };
