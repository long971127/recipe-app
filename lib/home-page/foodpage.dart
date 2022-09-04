import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/CategoriesContent.dart';
import 'package:recipe_app/model/FoodCategories.dart';
import '../components/locationBar.dart';
import '../components/searchBar.dart';
import '../model/FoodCategories.dart';
import 'detailsPage.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<FoodPage> {
  String categoryType = 'beef';
  Future<List<FoodCategory>> callCategoriesApi() async {
    var response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    var jsonData = jsonDecode(response.body);
    var finalJsonData = jsonData["categories"];
    List<FoodCategory> foodCategories = [];
    for (var f in finalJsonData) {
      FoodCategory foodCategory =
          FoodCategory(f['strCategory'], f['strCategoryThumb']);
      foodCategories.add(foodCategory);
    }
    return foodCategories;
  }

  Future<List<CategoriesContent>> callFoodApi() async {
    var responses = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryType"));
    var jsonData = jsonDecode(responses.body);
    var finalJsonDatas = jsonData["meals"];
    List<CategoriesContent> foodDetails = [];
    for (var f in finalJsonDatas) {
      CategoriesContent categoriesContent =
          CategoriesContent(f['strMeal'], f['strMealThumb'], f['idMeal']);
      foodDetails.add(categoriesContent);
    }
    return foodDetails;
  }

  void recallAPI() {
    setState(() {
      callFoodApi();
    });
  }

  @override
  void initState() {
    super.initState();
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
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: FutureBuilder<List<FoodCategory>>(
                              future: callCategoriesApi(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                    child: Text('Loading'),
                                  );
                                } else {
                                  return ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, i) {
                                        return Row(
                                          children: <Widget>[
                                            GestureDetector(
                                                onTap: () {
                                                  categoryType =
                                                      snapshot.data![i].name;
                                                  recallAPI();
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.all(
                                                      10.0),
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: <Widget>[
                                                          Image.network(
                                                            snapshot.data![i]
                                                                .imageURL,
                                                            height: 40,
                                                            width: 100,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                              snapshot.data![i]
                                                                  .name,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      )),
                                                ))
                                          ],
                                        );
                                      });
                                }
                              })),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0), //apply padding to all four sides
                        child: Text(
                          "Popular Food",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.5,
                          child: FutureBuilder<List<CategoriesContent>>(
                              future: callFoodApi(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                    child: Text('Loading'),
                                  );
                                } else {
                                  return ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsPage(
                                                          mealId: snapshot
                                                              .data![i].mealId,
                                                        )),
                                              );
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                                child: Row(
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Card(
                                                          child: Image.network(
                                                            snapshot.data![i]
                                                                .imageURL,
                                                            height: 200,
                                                            width: size.width *
                                                                0.97,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20.0),
                                                          child: Text(
                                                            snapshot
                                                                .data![i].name,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20.0,
                                                                    vertical:
                                                                        10.0),
                                                            child:
                                                                Row(children: <
                                                                    Widget>[
                                                              Text(
                                                                snapshot
                                                                    .data![i]
                                                                    .name,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            18),
                                                              ),
                                                            ]))
                                                      ],
                                                    )
                                                  ],
                                                )));
                                      });
                                }
                              }))
                      // Expanded(
                      //     child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const DetailsPage()),
                      //           );
                      //         },
                      //         child: Container(
                      //           height: 300,
                      //           margin:
                      //               const EdgeInsets.symmetric(vertical: 10),
                      //           decoration: const BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                   Radius.circular(10.0))),
                      //           // child: ListView.builder(
                      //           //   itemCount: itemsData.length,
                      //           //   itemBuilder: (context, index) {
                      //           //     return itemsData[index];
                      //           //   },
                      //           // )
                      //         )))
                    ])),
          ],
        ));
  }
}
