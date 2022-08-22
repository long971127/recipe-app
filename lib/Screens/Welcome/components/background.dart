import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 500,
      height: 500,
      color: Colors.red,
      child: child,
      //child: Text("HI"),
      // child: Container(
      //   constraints: const BoxConstraints(
      //       minHeight: 100, minWidth: 100, maxHeight: 300, maxWidth: 300),
      //   color: Colors.amber,
      //   child: Text("HI"),
      // )
      // child: Stack(
      // children: <Widget>[
      //   Positioned(
      //       top: 0,
      //       left: 0,
      //       child: Image.asset(
      //         '',
      //         width: size.width * 0.3,
      //       )),
      //   Positioned(
      //     bottom: 0,
      //     left: 0,
      //     child: Image.asset(
      //       '',
      //       width: size.width * 0.2,
      //     ),
      //   ),
      //   child,
      // ],
      // ),
    );
  }
}
