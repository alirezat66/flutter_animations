import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PositionAnimationScreen extends StatefulWidget {
  PositionAnimationScreen({Key? key}) : super(key: key);

  @override
  _PositionAnimationScreenState createState() =>
      _PositionAnimationScreenState();
}

class _PositionAnimationScreenState extends State<PositionAnimationScreen> {
  double _positioned = 190;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('Animation Position'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(IconlyLight.arrow_left)),
        ),
        body: Center(
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
            TextButton(
                onPressed: () {
                  setState(() {
                    _positioned = _positioned== 190? 0 : 190;
                  });
                },
                child: Text('animate'))
          ],
        )));
  }
}
