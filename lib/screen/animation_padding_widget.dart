import 'package:flutter/material.dart';

class PaddingAnimationWidget extends StatefulWidget {
  final Curve curve;
  PaddingAnimationWidget({Key? key, required this.curve}) : super(key: key);

  @override
  _PaddingAnimationWidgetState createState() => _PaddingAnimationWidgetState();
}

class _PaddingAnimationWidgetState extends State<PaddingAnimationWidget> {
  EdgeInsetsGeometry _padding = EdgeInsets.all(20);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedPadding(
            padding: _padding,
            duration: Duration(seconds: 1),
            curve: widget.curve,
            child: Container(
              height: 200,
              color: Color(0xffFF0000),
              child: Center(child: Text('AnimatedPadding')),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_padding == EdgeInsets.all(20)) {
                  setState(() {
                    _padding = EdgeInsets.all(40);
                  });
                } else {
                  setState(() {
                    _padding = EdgeInsets.all(20);
                  });
                }
              },
              child: Text('Animate'))
        ],
      ),
    );
  }
}
