import 'dart:convert';

import 'package:cocktail/Screens/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drink_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    print(res.body);

    drinks = jsonDecode(res.body)["drinks"];
    print(drinks);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Cocktail App"),
      ),
      body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return Card(
                      elevation: 8.0,
                      color: Colors.orange,
                      child: ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(drink["strDrinkThumb"]),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrinkDetail(drink: drink),
                              ));
                        },
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )),
    );
  }
}
