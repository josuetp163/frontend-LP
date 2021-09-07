import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:frontend/models/Spot.dart';

const String url = "http://localhost:3000/spot/";

class SpotHttp {
  Future<List<Spot>> getSpotList() async {
    var path = Uri.parse(url + "getSpots");
    http.Response response = await http.get(path);
    if (response.statusCode == 200) {
      Map spotData = convert.jsonDecode(response.body);
      List<dynamic> spots = spotData["results"];
      print(spots);
      return spots.map((json) => Spot.fromJson(json)).toList();
    } else {
      throw Exception("Problem en getSpotList: ${response.statusCode}");
    }
  }

  Future<Spot> postSpot(Spot spot) async {
    var path = Uri.parse(url + "newSpot");
    http.Response response = await http.post(path, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'image': spot.image,
      'spotName': spot.spotName,
      'description': spot.description,
      'city': spot.city,
      'x': spot.locationX,
      'y': spot.locationX,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return Spot.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Problem en postSpot: ${response.statusCode}");
    }
  }
}
