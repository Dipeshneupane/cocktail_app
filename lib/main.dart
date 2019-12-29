import 'package:flutter/material.dart';

import 'Screens/home.dart';

void main() => runApp(My_app());

class My_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: "cocktail",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
