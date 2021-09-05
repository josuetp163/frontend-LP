import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Huecas',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/home",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => new Home(),
        });
  }
}
