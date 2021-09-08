import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/Spot.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/theme.dart';
import 'dart:convert' as convert;

import 'admin.dart';

//widgets

class SpotUpdate extends StatelessWidget {
  late Spot spot;

  final _formKey = GlobalKey<FormState>();
  var _nombreController;
  var _localizationxController;
  var _localizationyController;
  var _ciudadController;
  var _descripcionController;
  var _imagenController;

  SpotUpdate(Spot spot) {
    this.spot = spot;
    _nombreController = TextEditingController(text: spot.spotName);
    _localizationxController = TextEditingController(text: spot.locationX.toString());
    _localizationyController = TextEditingController(text: spot.locationY.toString());
    _ciudadController = TextEditingController(text: spot.city);
    _descripcionController = TextEditingController(text: spot.description);
    _imagenController = TextEditingController(text: spot.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spot.spotName),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("ID: " + spot.id.toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Nombre: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _nombreController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Localizacion X: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _localizationxController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Localizacion Y: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _localizationyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Ciudad: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _ciudadController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Descripcion: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _descripcionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Text("Imagen: "),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: _imagenController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              postTest();
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Done')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, top: 20.0, bottom: 15.0, left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
          ]),
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
      Uri.parse('http://localhost:3000/spot/updateSpot'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': spot.id.toString(),
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