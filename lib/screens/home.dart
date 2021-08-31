import 'package:flutter/material.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/screens/admin.dart';
import 'package:frontend/widgets/card-small.dart';

//widgets

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Ice cream is made with carrageenan …",
    "image":
        "https://images.unsplash.com/photo-1516559828984-fb3b99548b21?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80"
  },
  "Makeup": {
    "title": "Is makeup one of your daily esse …",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80"
  },
  "Coffee": {
    "title": "Coffee is more than just a drink: It’s …",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80"
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80"
  }
};

class Home extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Huecas")),
      backgroundColor: ThemeColors.bgColorScreen,
      // key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: [
                  CardSmall(
                      cta: "View article",
                      title: homeCards["Makeup"]!['title'].toString(),
                      img: homeCards["Makeup"]!['image'].toString(),
                      flex: 6,
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                  CardSmall(
                      cta: "View article",
                      title: homeCards["Coffee"]!['title'].toString(),
                      img: homeCards["Coffee"]!['image'].toString(),
                      flex: 4,
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                    );
                  }, child: Text('Open route')),

            ],
              ),
      ),
    );
  }
}
