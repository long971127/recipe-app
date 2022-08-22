import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({Key? key}) : super(key: key);

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
