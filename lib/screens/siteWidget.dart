import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/theme.dart';

import 'package:frontend/models/Spot.dart';
import 'package:frontend/services/spotServ.dart';

List<List<String>> comments = [
  ["josuetp163", "La mejor comida que he probado"],
  ["edaneras", "No hay mejor comida"]
];

final newComments = <String>[];

class Site extends StatelessWidget {
  late Spot spot;

  Site(Spot spot) {
    this.spot = spot;
  }


  final _formKey = GlobalKey<FormState>();

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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0)),
                  image: DecorationImage(
                    image: NetworkImage(spot.image),
                    fit: BoxFit.cover,
                  )),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, top: 20.0, bottom: 15.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(spot.image, fit: BoxFit.cover),
                  Text(spot.spotName,
                      style:
                          TextStyle(color: ThemeColors.header, fontSize: 28)),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(spot.description,
                        style: TextStyle(
                          color: ThemeColors.text,
                          fontSize: 14,
                        )),
                  ),
                  RatingBar.builder(
                      initialRating: 5,
                      itemSize: 25,
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      }),
                  Expanded(
                    child: ListView(
                      children: _createComments(comments),
                    ),
                  ),
                ],
              ),
            )),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          showMessageDialog(context);
        },
        child: const Icon(Icons.message),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  showMessageDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Añada su comentario"),
            content: Expanded(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("Agrega tu comentario"),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre *',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          newComments.add(value);
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Comentario *',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              newComments.isEmpty) {
                            return 'Please enter some text';
                          }
                          newComments.add(value);
                          return null;
                        },
                      ),
                      RatingBar.builder(
                          initialRating: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          }),
                    ],
                  )),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("Comentar"),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    comments.add(newComments);
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }

  List<Widget> _createComments(comments) {
    final lista = <Widget>[];
    for (List<String> opt in comments) {
      final tempWidget = ListTile(
        title: Text(opt[0]),
        subtitle: Text(opt[1]),
      );
      lista.add(tempWidget);
      lista.add(Divider());
    }
    final SpotHttp spotserv = new SpotHttp();
    spotserv.getSpotList();
    return lista;
  }
}
