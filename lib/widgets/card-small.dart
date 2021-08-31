import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/screens/siteWidget.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.rate = 5,
      this.flex = 1,
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;
  final int flex;
  final double rate;
  Map<String, String> site = {};

  static defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Site({
              "title": title,
              "Description": cta,
              "img": img
              }))
            );
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0)),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            )))),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 15.0, left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: TextStyle(
                                  color: ThemeColors.header, fontSize: 22)),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(cta,
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
                    ))
              ],
            )),
      ),
    ));
  }
}
