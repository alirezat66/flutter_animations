import 'package:flutter/material.dart';

class PositionAnimationWidgwt extends StatefulWidget {
  final Curve curve;
  PositionAnimationWidgwt({Key key,  this.curve}) : super(key: key);

  @override
  _PositionAnimationWidgwtState createState() =>
      _PositionAnimationWidgwtState();
}

class _PositionAnimationWidgwtState extends State<PositionAnimationWidgwt> {
  double _positioned = 190;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: 180,
            height: 190,
          ),
          Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xffD9F2FE),
                borderRadius: BorderRadius.circular(50),
              )),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: widget.curve,
            top: _positioned,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset('images/avatar_1.png'),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _positioned = _positioned == 190 ? 0 : 190;
              });
            },
            child: Text('animate'))
      ],
    ));
  }
}
