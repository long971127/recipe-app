import 'package:recipe_app/model/food_category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<FoodCategory> foods = [];

Future<List<FoodCategory>> getFoodData() async {
  var response =
      await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));
  var jsonData = jsonDecode(response.body);
  foods = [];
  for (var f in jsonData) {
    FoodCategory food = FoodCategory(f['name'], f['email']);
    foods.add(food);
  }
  return foods;
}
