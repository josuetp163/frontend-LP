import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:frontend/models/Commentary.dart';

const url = "http://localhost:3000/commentary/";

class CommentaryHttp {
  Future<List<Commentary>> getUserList() async {
    var path = Uri.parse(url + "getCommentaries");
    http.Response response = await http.get(path);
    if (response.statusCode == 200) {
      Map commentData = convert.jsonDecode(response.body);
      List<dynamic> comments = commentData["results"];
      print(comments);
      return comments.map((json) => Commentary.fromJson(json)).toList();
    } else {
      throw Exception("Problem en getCommentaryList: ${response.statusCode}");
    }
  }

  Future<Commentary> postUser(Commentary comment, int idSpot) async {
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
      return Commentary.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Problem en postCommentary: ${response.statusCode}");
    }
  }
}
