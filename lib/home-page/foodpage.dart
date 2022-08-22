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
  List<Widget> categoryData = [];
  void getPostData() {
    List<dynamic> reponseList = FoodjsonData;
    List<Widget> listItems = [];
    List<Widget> categoryListItems = [];
    for (var element in reponseList) {
      listItems.add(Container(
          height: 150,
          width: 385,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    child: Image.network(
                      '${element['strCategoryThumb']}',
                      height: 140,
                      width: 385,
                    ),
                  ),
                ],
              )
            ],
          )));
    }
    for (var a in reponseList) {
      categoryListItems.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 120,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Image.network(
                        '${a['strCategoryThumb']}',
                        height: 80,
                        width: 200,
                      ),
                      Text(
                        a['strCategory'],
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )),
            )
          ],
        ),
      ));
    }

    setState(() {
      itemsData = listItems;
      categoryData = categoryListItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ListView.builder(
                itemCount: categoryData.length,
                itemBuilder: (context, i) {
                  return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(children: <Widget>[
                            categoryData[i],
                          ])));
                },
              ),
            ),
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
