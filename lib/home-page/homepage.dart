import 'package:flutter/material.dart';
import 'package:recipe_app/home-page/foodpage.dart';
import 'dart:math';

import '../components/searchBar.dart';
import 'beveragepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int foodItems = Random().nextInt(200);
    int beveragesItems = Random().nextInt(200);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text(
          "Menu",
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
          const Searhbar(),
          Expanded(
            child: Stack(children: [
              Positioned(
                top: 20,
                right: 310,
                child: Container(
                  width: 150,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(189, 9, 9, 1)),
                ),
              ),
              Positioned(
                  top: 80,
                  left: 30,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FoodPage()),
                        );
                      },
                      child: SizedBox(
                        width: size.width,
                        height: size.height * 0.4,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 35,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 25),
                                alignment: AlignmentDirectional.centerStart,
                                width: 300,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Food",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Sans Serif fonts',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text("$foodItems items"),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 15,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://i.picsum.photos/id/1060/5598/3732.jpg?hmac=31kU0jp5ejnPTdEt-8tAXU5sE-buU-y1W1qk_BsiUC8'),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              right: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.red,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
              Positioned(
                  top: 200,
                  left: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BeveragePage()),
                      );
                    },
                    child: SizedBox(
                        width: size.width,
                        height: size.height * 0.4,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 35,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 25),
                                alignment: AlignmentDirectional.centerStart,
                                width: 300,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Beverages",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Sans Serif fonts',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text("$beveragesItems items"),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 15,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://i.picsum.photos/id/1060/5598/3732.jpg?hmac=31kU0jp5ejnPTdEt-8tAXU5sE-buU-y1W1qk_BsiUC8'),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              right: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.red,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
