import 'package:flutter/material.dart';
import 'package:frontend/constants/theme.dart';
import 'package:frontend/widgets/card-small.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/User.dart';
import 'dart:convert';
import 'dart:convert' as convert;

import 'admin.dart';

//widgets

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            Text("Nombre: "),
            TextFormField(
              controller: _nombreController,
              // The validator receives the text that the user has entered.
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
            Text("Correo Electronico: "),
            TextFormField(
              controller: _emailController,
              // The validator receives the text that the user has entered.
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
            Text("Telefono: "),
            TextFormField(
              controller: _phoneController,
              // The validator receives the text that the user has entered.
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
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
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
    );
  }

  Future postTest() async {
    String nombre = _nombreController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    http.Response response = await http.post(
      Uri.parse('http://localhost:3000/user/newUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': nombre,
        'email': email,
        'phone': phone,
        'role': 'role',
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Problem en postUser: ${response.statusCode}");
    }
  }
}
