// @dart=2.9

import 'package:flutter/material.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/screens/admin.dart';
import 'package:frontend/screens/siteWidget.dart';
import 'package:frontend/widgets/card-small.dart';

import 'package:frontend/models/Spot.dart';
import 'package:frontend/services/spotServ.dart';

//widgets

final Map<String, Map<String, String>> homeCards = {
  "hueca1": {
    "title": "Las Comidas de Edwin",
    "localizacion": "222, 111, 333",
    "Ciudad": "Guayaquil",
    "Descripcion":
        "El mejor encebollado que puedes encontrar en la cuidad de Guayaquil.",
    "image":
        "https://media-cdn.tripadvisor.com/media/photo-p/13/05/aa/e0/photo0jpg.jpg"
  },
  "hueca2": {
    "title": "Chifa P. Kong",
    "localizacion": "111, 222, 333",
    "Ciudad": "Guayaquil",
    "Descripcion": "La mejor comida asiatica de todo el Ecuador.",
    "image":
        "https://saposyprincesas.elmundo.es/wp-content/uploads/2016/04/fideos-lo-mein.jpg"
  }
};

class Home extends StatelessWidget {
  final SpotHttp spotserv = new SpotHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Huecas"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                  );
                },
                child: Icon(
                  Icons.people,
                  size: 26.0,
                ),
              ))
        ],
      ),
      backgroundColor: ThemeColors.bgColorScreen,
      // key: _scaffoldKey,
      body: Container(
        child: FutureBuilder(
                future: spotserv.getSpotList(),
                builder:
                    (context, AsyncSnapshot<List<Spot>> snapshot) {
                  if (snapshot.hasData && !snapshot.data.isEmpty) {
                    final spots = snapshot.data;
                    return ListView.builder(
                        itemCount: spots.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,i) => _listaSpots(spots[i])
                    );
                  }
                  return Text("No funciona");
                }),
      ),
    );
  }


  Widget _listaSpots(Spot spot) {
    print(spot);
    return new CardSmall(spot);
  }
}
