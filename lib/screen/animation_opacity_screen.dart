import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OpacityAnimationScreen extends StatefulWidget {
  OpacityAnimationScreen({Key? key}) : super(key: key);

  @override
  _OpacityAnimationScreenState createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen> {
  double width = 300;
  double height = 250;
  double radius = 20;
  Color color = Colors.amber;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Animation Opacity'),
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
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(radius)),
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
      ),
    );
  }
}
