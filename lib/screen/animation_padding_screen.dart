import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PaddingAnimationScreen extends StatefulWidget {
  PaddingAnimationScreen({Key? key}) : super(key: key);

  @override
  _PaddingAnimationScreenState createState() => _PaddingAnimationScreenState();
}

class _PaddingAnimationScreenState extends State<PaddingAnimationScreen> {
  EdgeInsetsGeometry _padding = EdgeInsets.all(20);
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
            children: [
              AnimatedPadding(
                padding: _padding,
                duration: Duration(seconds: 1),
                child: Container(
                  height: 200,
                  color: Color(0xffFF0000),
                ),
              ),
              TextButton(
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
        ));
  }
}
