import 'package:flutter/material.dart';

class OpacityAnimationWidget extends StatefulWidget {
  final Curve curve;
  OpacityAnimationWidget({Key key, this.curve}) : super(key: key);

  @override
  _OpacityAnimationWidgetState createState() => _OpacityAnimationWidgetState();
}

class _OpacityAnimationWidgetState extends State<OpacityAnimationWidget> {
  double width = 300;
  double height = 250;
  double radius = 20;
  Color color = Colors.amber;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 1),
            curve: widget.curve,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(radius)),
              child: Center(
                child: Text('AnimatedOpacity'),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = opacity == 1 ? 0.4 : 1;
                });
              },
              child: Text('animate'))
        ],
      ),
    );
  }
}
