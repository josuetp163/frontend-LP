import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:frontend/models/User.dart';

const url = "http://localhost:3000/users/";
//const url = "http://localhost:3000/commentary";

class UserHttp {
  Future<List<User>> getUserList() async {
    var path = Uri.parse(url + "getUsers");
    http.Response response = await http.get(path);
    if (response.statusCode == 200) {
      Map userData = convert.jsonDecode(response.body);
      List<dynamic> users = userData["results"];
      print(users);
      return users.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Problem en getUserList: ${response.statusCode}");
    }
  }

  Future<User> postUser(User user) async {
    var path = Uri.parse(url + "newUser");
    http.Response response = await http.post(path, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'enable': user.role
    });
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Problem en postUser: ${response.statusCode}");
    }
  }
}
