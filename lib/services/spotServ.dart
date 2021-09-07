import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/models/Spot.dart';

const String url = "http://localhost:3000/spot/";

class SpotHttp {

  Future<List<Spot>> getSpotList() async {
    var path = Uri.parse(url + "getSpots");
    http.Response response = await http.get(path);
    if (response.statusCode == 200) {
      List<Spot> spots = [];
      List<dynamic> decodedData = json.decode(response.body);
      for (var item in decodedData) {
        final spot = new Spot.fromJson(item);
        spots.add(spot);
      }
      return spots;
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
      return Spot.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Problem en postSpot: ${response.statusCode}");
    }
  }
}
