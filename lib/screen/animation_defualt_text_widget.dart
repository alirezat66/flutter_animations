import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final Curve curve;
  AnimatedTextWidget({Key? key, required this.curve}) : super(key: key);

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  bool isAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
              child: Text('It is AnimatedDefaultTextStyle'),
              style: isAnimated
                  ? TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.green)
                  : TextStyle(fontSize: 16, color: Colors.black),
              duration: Duration(seconds: 1),
              curve: widget.curve,),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isAnimated = !isAnimated;
                });
              },
              child: Text('Animate'))
        ],
      ),
    );
  }
}
