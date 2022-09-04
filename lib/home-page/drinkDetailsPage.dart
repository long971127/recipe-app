import 'package:flutter/material.dart';
import 'package:recipe_app/components/ingredientSlot.dart';
import 'package:recipe_app/home-page/foodpage.dart';
import 'package:recipe_app/model/SelectedFoodDrinkDetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore_for_file: file_names

class DrinkDetailsPage extends StatefulWidget {
  const DrinkDetailsPage({Key? key, required this.mealId}) : super(key: key);
  final String mealId;

  @override
  // ignore: library_private_types_in_public_api
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DrinkDetailsPage> {
  String pageSelection = 'ingredients';
  int servingQuantity = 1;
  List<Widget> itemsData = [];
  Future<SelectedFoodDrinkDetails> getDetailsData() async {
    var response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${widget.mealId}"));
    var jsonData = jsonDecode(response.body);
    var f = jsonData["drinks"][0];
    SelectedFoodDrinkDetails selectedFoodDrinkDetails =
        SelectedFoodDrinkDetails(
      f['strDrink'],
      f['strDrinkThumb'],
      f['strIngredient1'],
      f['strIngredient2'],
      f['strIngredient3'],
      f['strMeasure1'],
      f['strMeasure2'],
      f['strMeasure3'],
      f['strInstructions'],
    );
    return selectedFoodDrinkDetails;
  }

  void increaseQuantity() {
    setState(() {
      servingQuantity++;
    });
  }

  void decreaseQunatity() {
    setState(() {
      if (servingQuantity != 1) {
        servingQuantity--;
      } else {
        servingQuantity = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder<SelectedFoodDrinkDetails>(
            future: getDetailsData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('Errors'),
                );
              } else {
                // return ListView.builder(itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Image.network(
                        snapshot.data!.imageURL,
                        height: 300,
                        width: size.width,
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: 25,
                        left: 5,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FoodPage()),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 25.0,
                              ),
                            )),
                      ),
                      Positioned(
                        top: 85,
                        left: 20,
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            Text(
                              '4.9 = 15:06',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 165,
                        left: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 70, 70, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(168, 183, 183, 183))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.comment_rounded,
                                color: Colors.black,
                                size: 28.0,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              const Text("350"),
                              SizedBox(
                                width: size.width * 0.47,
                              ),
                              const Icon(
                                Icons.star_outline,
                                color: Colors.black,
                                size: 28.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              const Icon(
                                Icons.bookmark_outline,
                                color: Colors.black,
                                size: 28.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              const Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        pageSelection == 'ingredients'
                            ? Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color:
                                        const Color.fromRGBO(255, 70, 70, 1)),
                                child: const Text(
                                  "Ingredients",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.35,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageSelection = 'ingredients';
                                      });
                                    },
                                    child: const Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                        pageSelection == 'steps'
                            ? Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color:
                                        const Color.fromRGBO(255, 70, 70, 1)),
                                child: const Text(
                                  "Steps",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.23,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageSelection = 'steps';
                                      });
                                    },
                                    child: const Text(
                                      "Steps",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                        pageSelection == 'nutrition'
                            ? Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color:
                                        const Color.fromRGBO(255, 70, 70, 1)),
                                child: const Text(
                                  "Nutrition",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: size.width * 0.26,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageSelection = 'nutrition';
                                      });
                                    },
                                    child: const Text(
                                      "Nutrition",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                      ],
                    ),
                    pageSelection == 'ingredients'
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Ingredient For",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Sans Serif fonts',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '$servingQuantity servings',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Sans Serif fonts'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * 0.35,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: const Color.fromRGBO(
                                            255, 70, 70, 1)),
                                    child: GestureDetector(
                                      onTap: increaseQuantity,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$servingQuantity',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: const Color.fromRGBO(
                                            255, 70, 70, 1)),
                                    child: GestureDetector(
                                      onTap: decreaseQunatity,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : pageSelection == 'steps'
                            ? SizedBox(
                                height: size.height * 0.45,
                                child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        snapshot.data!.instruction,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Sans Serif fonts',
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                    )))
                            : const SizedBox(
                                height: 0,
                              ),
                    pageSelection == 'ingredients'
                        ? Expanded(
                            child: Container(
                                height: 300,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: IngredientSlot(
                                  ingredientsName1: snapshot.data!.ingredient1,
                                  ingredientsName2: snapshot.data!.ingredient2,
                                  ingredientsName3: snapshot.data!.ingredient3,
                                  ingredientQuantity1:
                                      snapshot.data!.ingredientMeasure1,
                                  ingredientQuantity2:
                                      snapshot.data!.ingredientMeasure2,
                                  ingredientQuantity3:
                                      snapshot.data!.ingredientMeasure3,
                                  servingQuantity:
                                      servingQuantity, // ingredientList[index],
                                  // measureList[index]
                                )))
                        : const SizedBox(
                            height: 0,
                          )
                  ],
                );
              }
            }));
  }
}
