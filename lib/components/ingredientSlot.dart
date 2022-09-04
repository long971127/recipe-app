// ignore: file_names
import 'package:flutter/material.dart';

class IngredientSlot extends StatelessWidget {
  const IngredientSlot({
    Key? key,
    required this.servingQuantity,
    required this.ingredientsName1,
    required this.ingredientsName2,
    required this.ingredientsName3,
    required this.ingredientQuantity1,
    required this.ingredientQuantity2,
    required this.ingredientQuantity3,
  }) : super(key: key);
  final int servingQuantity;
  final String ingredientsName1;
  final String ingredientsName2;
  final String ingredientsName3;
  final String ingredientQuantity1;
  final String ingredientQuantity2;
  final String ingredientQuantity3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: AlignmentDirectional.centerStart,
                width: size.width,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(168, 183, 183, 183)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.network(
                      ('https://i.picsum.photos/id/1060/5598/3732.jpg?hmac=31kU0jp5ejnPTdEt-8tAXU5sE-buU-y1W1qk_BsiUC8'),
                      height: 45,
                      width: 45,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          ingredientsName1,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sans Serif fonts',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${servingQuantity * int.parse(ingredientQuantity1.replaceAll(RegExp("[a-zA-Z:s]"), ""))}${ingredientQuantity1.replaceAll(RegExp(r"[0-9]+"), "")}',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: AlignmentDirectional.centerStart,
                width: size.width,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(168, 183, 183, 183)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.network(
                      ('https://picsum.photos/250?image=9'),
                      height: 45,
                      width: 45,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          ingredientsName2,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sans Serif fonts',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${servingQuantity * int.parse(ingredientQuantity2.replaceAll(RegExp("[a-zA-Z:s]"), ""))}${ingredientQuantity2.replaceAll(RegExp(r"[0-9]+"), "")}',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: AlignmentDirectional.centerStart,
                width: size.width,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(168, 183, 183, 183)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.network(
                      ('https://picsum.photos/250?image=9'),
                      height: 45,
                      width: 45,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          ingredientsName3,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sans Serif fonts',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${servingQuantity * int.parse(ingredientQuantity3.replaceAll(RegExp("[a-zA-Z:s]"), ""))}${ingredientQuantity3.replaceAll(RegExp(r"[0-9]+"), "")}',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }
}
