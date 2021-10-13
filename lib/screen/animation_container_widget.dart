import 'package:flutter/material.dart';

class AnimationContainerWidget extends StatefulWidget {
  const AnimationContainerWidget({Key? key}) : super(key: key);

  @override
  _AnimationContainerWidgetState createState() =>
      _AnimationContainerWidgetState();
}

class _AnimationContainerWidgetState extends State<AnimationContainerWidget>
    with TickerProviderStateMixin {
  double width = 300;
  double height = 150;
  double radius = 20;
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            curve: Curves.easeInToLinear,
            duration: Duration(milliseconds: 600),
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: color,
            ),
            child: Center(child: Text('AnimatedContainer')),
          ),
          SizedBox(height: 10),
          AnimatedSize(
            duration: Duration(milliseconds: 600),
            vsync: this,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: color,
              ),
              child: Center(child: Text('AnimatedSize')),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  width = width == 300 ? 250 : 300;
                  height = height == 150 ? 200 : 150;
                  color =
                      color == Colors.amber ? Colors.redAccent : Colors.amber;
                  radius = radius == 20 ? 5 : 20;
                });
              },
              child: Text('animate')),
        ],
      ),
    );
  }
}
