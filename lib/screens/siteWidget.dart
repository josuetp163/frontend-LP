import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/theme.dart';


List<List<String>> comments = [
  [
    "josuetp163",
    "La mejor comida que he probado"
  ],
  [
    "edaneras",
    "No hay mejor comida"
  ]
];


class Site extends StatelessWidget {

  Site(Map<String,String> site){
    this.site = site;
  }
  Map<String, String> site = {};

  @override
  Widget build(BuildContext context) {
    print(site["img"]);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.site["title"].toString()),
      ),
      body: Center(
        child: Container(
          child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0)),
                      image: DecorationImage(
                        image: NetworkImage(this.site["img"].toString()),
                        fit: BoxFit.cover,
                      )),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right:20.0, top: 20.0, bottom: 15.0, left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(site["img"].toString(), fit: BoxFit.cover),
                          Text(this.site["title"].toString(),
                              style: TextStyle(
                                  color: ThemeColors.header, fontSize: 28)),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(this.site["Description"].toString(),
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
                              onRatingUpdate: (rating){
                                print(rating);
                              }),
                          Expanded(
                              child:ListView(
                              children: _createComments(comments),
                          ),)
                        ],


                      ),
                    )),

              ]
          ),
        ),
      ),
    );
  }

  List<Widget> _createComments(comments){
    final lista = <Widget>[];
    for (List<String> opt in comments) {
      final tempWidget = ListTile(title: Text(opt[0]), subtitle: Text(opt[1]),);
      lista.add(tempWidget);
      lista.add(Divider());
    }
    return lista;
  }

}
