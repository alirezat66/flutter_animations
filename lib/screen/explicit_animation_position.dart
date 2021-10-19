import 'package:flutter/material.dart';

class ExplicitPositionAnimation extends StatefulWidget {
  ExplicitPositionAnimation({Key? key}) : super(key: key);

  @override
  _ExplicitPositionAnimationState createState() =>
      _ExplicitPositionAnimationState();
}

class _ExplicitPositionAnimationState extends State<ExplicitPositionAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = new AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.9,
    );
    _animationController.addListener(() {
      setState(() {
        
      });
    });
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double position = MediaQuery.of(context).size.width;
    double value = position * _animationController.value;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            color: Colors.green),
        Positioned(
            top: value,
            child: Container(width: 50, height: 50, color: Colors.red)),
        Positioned(
            top: value,
            left: value,
            child: Container(width: 50, height: 50, color: Colors.blue)),
        Positioned(
            top: value,
            right: value,
            child: Container(width: 50, height: 50, color: Colors.yellow))
      ],
    );
  }
}
