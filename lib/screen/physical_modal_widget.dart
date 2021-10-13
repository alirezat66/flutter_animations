import 'package:flutter/material.dart';

class PhysicalModalAnimation extends StatefulWidget {
  final Curve curve;
  PhysicalModalAnimation({Key? key,required this.curve}) : super(key: key);

  @override
  _PhysicalModalAnimationState createState() => _PhysicalModalAnimationState();
}

class _PhysicalModalAnimationState extends State<PhysicalModalAnimation> {
  bool _isAnimate = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          child: AnimatedPhysicalModel(
            color: Colors.red,
            curve: widget.curve,
            elevation: _isAnimate? 20: 10,
            shadowColor: _isAnimate? Colors.brown: Colors.red,
            duration: Duration(seconds: 1),
            shape: BoxShape.rectangle,
            child: Container(
              width: 200,
              height: 200,
              child: Center(child: Text('AnimatedPhysicalModel')),
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isAnimate = !_isAnimate;
            });
          },
          child: Text('animate'),
        )
      ],
    );
  }
}
