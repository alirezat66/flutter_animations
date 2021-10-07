import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AlignmentAnimationScreen extends StatefulWidget {
  AlignmentAnimationScreen({Key? key}) : super(key: key);

  @override
  _AlignmentAnimationScreenState createState() =>
      _AlignmentAnimationScreenState();
}

class _AlignmentAnimationScreenState extends State<AlignmentAnimationScreen> {
  Alignment firstAlignment = Alignment.center;
  Alignment secondAlignment = Alignment.center;
  Alignment thirdAlignment = Alignment.center;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Animation Alignment'),
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
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Color(0xffFFFF00),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: opacity,
                  child: Container(
                      width: 50, height: 50, color: Color(0xffbfa000)),
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
      ),
    );
  }
}
