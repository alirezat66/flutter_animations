import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CrossFadeAnimationScreen extends StatefulWidget {
  CrossFadeAnimationScreen({Key? key}) : super(key: key);

  @override
  _CrossFadeAnimationScreenState createState() =>
      _CrossFadeAnimationScreenState();
}

class _CrossFadeAnimationScreenState extends State<CrossFadeAnimationScreen> {
  CrossFadeState state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Animation crossfade'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrow_left)),
      ),
      body: Center(
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                ),
                firstCurve: Curves.easeInToLinear,
                secondCurve: Curves.easeInToLinear,
                sizeCurve: Curves.bounceOut,
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
      ),
    );
  }
}
