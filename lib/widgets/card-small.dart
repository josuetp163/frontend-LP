import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/models/Spot.dart';
import 'package:frontend/screens/siteWidget.dart';

class CardSmall extends StatelessWidget {

  late Spot spot;

  CardSmall(Spot spot){
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
              MaterialPageRoute(builder: (context) => Site(spot))
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
}
