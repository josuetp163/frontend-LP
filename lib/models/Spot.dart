import 'package:json_annotation/json_annotation.dart';
part 'Spot.g.dart';

@JsonSerializable()
class Spot {
  late int? id;
  late String image;
  late String spotName;
  late String description;
  late String city;
  late bool? enable;
  late double locationX;
  late double locationY;

  Spot(
      {this.id,
      required this.image,
      required this.spotName,
      required this.description,
      required this.city,
      this.enable,
      required this.locationX,
      required this.locationY});

  @override
  String toString() {
    return "spot:$spotName - city:$city - description:$description";
  }

  factory Spot.fromJson(dynamic json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);
}
