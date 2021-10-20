import 'package:flutter/material.dart';

class CrossFadeAnimationWidget extends StatefulWidget {
  final Curve curve;
  CrossFadeAnimationWidget({Key key, this.curve}) : super(key: key);

  @override
  _CrossFadeAnimationWidgetState createState() =>
      _CrossFadeAnimationWidgetState();
}

class _CrossFadeAnimationWidgetState extends State<CrossFadeAnimationWidget> {
  CrossFadeState state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedCrossFade(
              firstChild: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text('AnimatedCrossFade')),
              ),
              secondChild: Container(
                width: 100,
                height: 100,
                child: Center(child: Text('CrossFade')),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
              ),
              firstCurve: widget.curve,
              secondCurve: widget.curve,
              sizeCurve: widget.curve,
              crossFadeState: state,
              duration: Duration(seconds: 1)),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  state = state == CrossFadeState.showFirst
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst;
                });
              },
              child: Text('animate'))
        ],
      ),
    );
  }
}
