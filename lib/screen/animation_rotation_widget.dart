import 'package:animation_training/screen/animated_clock.dart';
import 'package:animation_training/screen/clock_widget.dart';
import 'package:animation_training/screen/digital_clock_without_animation.dart';
import 'package:flutter/material.dart';

class AnimatedRotationWidget extends StatefulWidget {
  AnimatedRotationWidget({Key key}) : super(key: key);

  @override
  _AnimatedRotationWidgetState createState() => _AnimatedRotationWidgetState();
}

class _AnimatedRotationWidgetState extends State<AnimatedRotationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DigitalClockWithoutAnimation(),
      SizedBox(
        height: 10,
      ),
      Text(
        'Analog Clock Without Animation',
        style: TextStyle(fontSize: 22),
      ),
      SizedBox(
        height: 10,
      ),
      Clock(),
      SizedBox(
        height: 10,
      ),
      Text(
        'Analog Clock With Animation',
        style: TextStyle(fontSize: 22),
      ),
      SizedBox(
        height: 10,
      ),
      AnimatedClock(),
    ]);
  }
}
