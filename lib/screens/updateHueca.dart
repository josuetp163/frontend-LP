import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/widgets/card-small.dart';

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
      child: Column(
        children: [
          CardSmall(
              cta: homeCards["hueca1"]!['Descripcion'].toString(),
              title: homeCards["hueca1"]!['title'].toString(),
              img: homeCards["hueca1"]!['image'].toString(),
              tap: () {
              }),
          CardSmall(
              cta: homeCards["hueca2"]!['Descripcion'].toString(),
              title: homeCards["hueca2"]!['title'].toString(),
              img: homeCards["hueca2"]!['image'].toString(),
              tap: () {
              }),
        ],
      ),
    );
  }
}