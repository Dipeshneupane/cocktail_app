import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(drink["strDrink"]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: drink["idDrink"],
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(drink["strDrinkThumb"]),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Id: ${drink["idDrink"]}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "${drink["strDrink"]}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
