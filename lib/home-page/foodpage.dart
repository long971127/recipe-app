import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/categoryRow.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/mockData/foodjsonData.dart';
import '../components/locationBar.dart';
import '../components/searchBar.dart';
import '../model/food_category.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<FoodPage> {
  // Future<List<FoodCategory>> getFoodData() async {
  //   var response = await http.get(
  //       Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
  //   var jsonData = jsonDecode(response.body);
  //   List<FoodCategory> foodCategories = [];
  //   for (var f in jsonData) {
  //     FoodCategory foodCategory = FoodCategory(f['name'], f['email']);
  //     foodCategories.add(foodCategory);
  //   }
  //   return foodCategories;
  // }
  List<Widget> itemsData = [];
  void getPostData() {
    List<dynamic> reponseList = FoodjsonData;
    List<Widget> listItems = [];
    for (var element in reponseList) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        child: Image.network(
                          '${element['strCategoryThumb']}',
                          height: 150,
                          width: 300,
                        ),
                      ),
                      // Text(
                      //   element['strCategory'],
                      //   style: const TextStyle(fontSize: 28),
                      // ),
                    ],
                  )
                ],
              ))));
    }

    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: const Text(
            "Good Morning Akila!",
            style: TextStyle(color: Colors.black),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationBar(),
            const Searhbar(),
            const CategoryRow(),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0), //apply padding to all four sides
              child: Text(
                "Popular Food",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemsData.length,
                itemBuilder: (context, index) {
                  return itemsData[index];
                },
              ),
            )
          ],
        ));
  }
}
