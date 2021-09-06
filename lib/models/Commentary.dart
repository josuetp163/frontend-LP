import 'package:json_annotation/json_annotation.dart';
import 'package:frontend/models/Spot.dart';
part 'Commentary.g.dart';

@JsonSerializable()
class Commentary {
  late int? id;
  late String description;
  late String score;
  late String userName;
  Spot spot;

  Commentary(
      {this.id,
      required this.description,
      required this.score,
      required this.userName,
      required this.spot});

  @override
  String toString() {
    return "user:$userName - commentary:$description";
  }

  factory Commentary.fromJson(Map<String, dynamic> json) =>
      _$CommentaryFromJson(json);

  Map<String, dynamic> toJson() => _$CommentaryToJson(this);
}
