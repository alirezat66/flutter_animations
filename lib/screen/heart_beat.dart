import 'package:flutter/material.dart';

class HeartBeat extends StatefulWidget {
  HeartBeat({Key? key}) : super(key: key);

  @override
  _HeartBeatState createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _beatForward, _beatBackward;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 857,
      ),
    )..addListener(() {
        setState(() {});
      });
    _beatForward = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.20,
          0.55,
          curve: Curves.easeIn,
        ),
      ),
    );
    _beatBackward = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.55,
          1.00,
          curve: Curves.easeInCubic,
        ),
      ),
    );
    _controller.repeat().orCancel;
    super.initState();
  }
 @override
  void didUpdateWidget(HeartBeat oldWidget) {
    _controller.reset();
    _controller.repeat().orCancel;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Transform.scale(
          scale: _beatForward.value,
          child: Transform.scale(
              scale: _beatBackward.value, child: Image.asset('images/heart_image.png'))),
    );
  }
}
