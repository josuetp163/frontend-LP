import 'package:json_annotation/json_annotation.dart';
part 'Spot.g.dart';

@JsonSerializable()
class Spot {
  late int? id;
  late String image;
  late String spotName;
  late String description;
  late String city;
  late int x;
  late int y;

  Spot(
      {this.id,
      required this.image,
      required this.spotName,
      required this.description,
      required this.city,
      required this.x,
      required this.y});

  @override
  String toString() {
    return "spot:$spotName - city:$city - description:$description";
  }

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);
}
