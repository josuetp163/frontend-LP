import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/models/Commentary.dart';

const String url = "http://localhost:3000/commentary/";

class CommentaryHttp {

  Future<List<Commentary>> getComments(int? idSpot) async {
    var path = Uri.parse(url + "getComBySpot/" + idSpot.toString());
    http.Response response = await http.get(path);
    if (response.statusCode == 200) {
      List<Commentary> comments = [];
      List<dynamic> decodedData = json.decode(response.body);
      for (var item in decodedData){
        final com = new Commentary(id: item["id"],description: item["description"].toString(),score: item["score"].toString(),userName: item["userName"].toString());
        comments.add(com);
      }
      return comments;
    } else {
      throw Exception("Problem en postCommentary: ${response.statusCode}");
    }
  }

  Future<Commentary> postComentary(Commentary comment, int idSpot) async {
    var path = Uri.parse(url + "newCommentary");
    http.Response response = await http.post(path, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'description': comment.description,
      'score': comment.score,
      'userName': comment.userName,
      'spot': idSpot
    });
    if (response.statusCode == 200) {
      print(response.body);
      return Commentary.fromJson(json.decode(response.body));
    } else {
      throw Exception("Problem en postCommentary: ${response.statusCode}");
    }
  }
}
