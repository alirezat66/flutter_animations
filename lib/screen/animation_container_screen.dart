import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnimationContainerScreen extends StatefulWidget {
  const AnimationContainerScreen({Key? key}) : super(key: key);

  @override
  _AnimationContainerScreenState createState() =>
      _AnimationContainerScreenState();
}

class _AnimationContainerScreenState extends State<AnimationContainerScreen> {
  double width = 300;
  double height = 250;
  double radius = 20;
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Animation Container'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrow_left)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Animation Container'),
              AnimatedContainer(
                curve: Curves.easeInToLinear,
                duration: Duration(milliseconds: 600),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: color,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      width = width == 300 ? 250 : 300;
                      height = height == 250 ? 300 : 250;
                      color = color == Colors.amber
                          ? Colors.redAccent
                          : Colors.amber;
                      radius = radius == 20 ? 5 : 20;
                    });
                  },
                  child: Text('animate'))
            ],
          ),
        ),
      ),
    );
  }
}
