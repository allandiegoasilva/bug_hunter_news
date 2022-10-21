import 'package:flutter/material.dart';

class BlurWidget extends StatefulWidget {
  const BlurWidget({super.key});

  @override
  State<BlurWidget> createState() => _BlurWidgetState();
}

class _BlurWidgetState extends State<BlurWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height * 0.5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
              )
            ],
            border:
                Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2)
              ],
              stops: [0.0, 1.0],
            )),
        child: Column(
          children: [],
        ),
      ),
    ]);
  }
}
