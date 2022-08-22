// ignore: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recipe_app/model/food_category.dart';

class ProductColumn extends StatefulWidget {
  final String categoryData;
  // ignore: use_key_in_widget_constructors
  const ProductColumn({required this.categoryData});
  @override
  // ignore: library_private_types_in_public_api
  _DataFromAPI createState() => _DataFromAPI();
}

class _DataFromAPI extends State<ProductColumn> {
  Future<List<FoodCategory>> getFoodData() async {
    var response =
        await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<FoodCategory> foods = [];
    for (var f in jsonData) {
      FoodCategory food = FoodCategory(f['name'], f['email']);
      foods.add(food);
    }
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder<List<FoodCategory>>(
            future: getFoodData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(child: Text('Loading...'));
              } else {
                // ignore: avoid_print
                print(snapshot.data);
                return Container();
              }
            }));
  }
}
