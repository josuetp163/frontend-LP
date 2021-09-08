import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/Spot.dart';
import 'package:frontend/screens/siteWidget.dart';
import 'package:frontend/constants/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/screens/spotUpdate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class SpotCardUpdate extends StatelessWidget {

  late Spot spot;
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _localizationxController = TextEditingController();
  final _localizationyController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _imagenController = TextEditingController();

  SpotCardUpdate(Spot spot){
    this.spot = spot;
  }

  static defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpotUpdate(spot))
          );
        },
        child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0)),
                        image: DecorationImage(
                          image: NetworkImage(spot.image),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 15.0, left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(spot.spotName,
                          style: TextStyle(
                              color: ThemeColors.header, fontSize: 22)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(spot.description,
                            style: TextStyle(
                              color: ThemeColors.text,
                              fontSize: 17,
                            )),
                      ),
                      RatingBar.builder(
                          initialRating: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating){
                            print(rating);
                          })
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  Future postTest() async {
    String nombre = _nombreController.text;
    String localizationx = _localizationxController.text;
    String localizationy = _localizationyController.text;
    String ciudad = _ciudadController.text;
    String descripcion = _descripcionController.text;
    String imagen = _imagenController.text;

    http.Response response = await http.post(
      Uri.parse('http://localhost:3000/spot/newSpot'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'spotName': nombre,
        'locationX': localizationx,
        'locationY': localizationy,
        'city': ciudad,
        'description': descripcion,
        'image': imagen,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Spot.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Problem en postSpot: ${response.statusCode}");
    }
  }
}