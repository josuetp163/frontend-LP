import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/widgets/card-small.dart';
import 'package:frontend/widgets/spot-card-update.dart';


import 'package:frontend/models/Spot.dart';
import 'package:frontend/services/spotServ.dart';

//widgets

final Map<String, Map<String, String>> homeCards = {
  "hueca1": {
    "title": "Las Comidas de Edwin",
    "localizacion": "222, 111, 333",
    "Ciudad": "Guayaquil",
    "Descripcion": "El mejor encebollado que puedes encontrar en la cuidad de Guayaquil.",
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

class UpdateHueca extends StatelessWidget {
  const UpdateHueca({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0,bottom: 25, top: 25),
      child: FutureBuilder(
          future: new SpotHttp().getSpotList(),
          builder:
              (context, AsyncSnapshot<List<Spot>> snapshot) {
            if (snapshot.hasData) {
              final spots = snapshot.data;
              return ListView.builder(
                  itemCount: spots!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,i) => _listaSpots(spots[i])
              );
            }
            return Text("No funciona");
          }),
    );
  }

  Widget _listaSpots(Spot spot) {
    print(spot);
    return new SpotCardUpdate(spot);
  }
}