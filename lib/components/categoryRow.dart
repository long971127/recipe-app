import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final List<Widget> listData;
  // ignore: use_key_in_widget_constructors
  const CategoryRow({required this.listData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 80,
              decoration: const BoxDecoration(color: Colors.orange),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 80,
              decoration: const BoxDecoration(color: Colors.orange),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 80,
              decoration: const BoxDecoration(color: Colors.orange),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 80,
              decoration: const BoxDecoration(color: Colors.orange),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.only(right: 20),
              height: 80,
              decoration: const BoxDecoration(color: Colors.orange),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
