import 'package:dio/dio.dart';

class SpottHttp {
  late Dio dio;
  late List<Spot> spot;

  SpottHttp() {
    dio = new Dio();
  }

  Future getHttp() async {
    String url = "";
    try {
      var response = await Dio().get(
        url,
        options: Options(method: 'GET'),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future getHttpById(String id) async {
    String url = "";
    try {
      var response = await Dio().get(
        url + "/${id}",
        options: Options(method: 'GET'),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future postHttp(Spot spot) async {
    String url = "";
    try {
      var response = await dio.post(
        url,
        data: {
          'imagen': spot.imagen,
          'titulo': spot.titulo,
          'descripcion': spot.descripcion,
          'locX': spot.locX,
          'locY': spot.locY,
        },
        options: Options(method: 'POST'),
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future postHttpById(String id, Spot spot) async {
    String url = "";
    try {
      var response = await dio.post(
        url + "/${id}",
        data: {
          'id': id,
          'imagen': spot.imagen,
          'titulo': spot.titulo,
          'descripcion': spot.descripcion,
          'locX': spot.locX,
          'locY': spot.locY,
        },
        options: Options(method: 'POST'),
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }
}

class Spot {
  late String imagen;
  late String titulo;
  late String descripcion;
  late double locX;
  late double locY;

  Spot(String imagen, String titulo, String descripcion, double locX,
      double locY) {
    this.imagen = imagen;
    this.titulo = titulo;
    this.descripcion = descripcion;
    this.locX = locX;
    this.locY = locY;
  }

  String toString() {
    return "titulo: ${this.titulo} - descripcion: ${this.descripcion}";
  }
}
