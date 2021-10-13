import 'package:flutter/material.dart';

class AlignmentAnimationWidget extends StatefulWidget {
  final Curve curve;
  AlignmentAnimationWidget({Key? key, required this.curve}) : super(key: key);

  @override
  _AlignmentAnimationWidgetState createState() =>
      _AlignmentAnimationWidgetState();
}

class _AlignmentAnimationWidgetState extends State<AlignmentAnimationWidget> {
  Alignment firstAlignment = Alignment.center;
  Alignment secondAlignment = Alignment.center;
  Alignment thirdAlignment = Alignment.center;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('AnimatedAlign'),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: AnimatedAlign(
                  alignment: firstAlignment,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Color(0xffFF0000),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: AnimatedAlign(
                  alignment: secondAlignment,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Color(0xffFFA500),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: AnimatedAlign(
                  alignment: thirdAlignment,
                  duration: Duration(seconds: 1),
                  curve: widget.curve,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Color(0xffFFFF00),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                curve: widget.curve,
                opacity: opacity,
                child:
                    Container(width: 50, height: 50, color: Color(0xffbfa000)),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  firstAlignment = firstAlignment == Alignment.center
                      ? Alignment.topLeft
                      : Alignment.center;
                  secondAlignment = secondAlignment == Alignment.center
                      ? Alignment.centerLeft
                      : Alignment.center;
                  thirdAlignment = thirdAlignment == Alignment.center
                      ? Alignment.bottomLeft
                      : Alignment.center;
                  opacity = opacity == 1 ? 0 : 1;
                });
              },
              child: Text('animate'))
        ],
      ),
    );
  }
}
