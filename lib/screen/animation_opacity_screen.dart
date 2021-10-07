import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OpacityAnimationScreen extends StatefulWidget {
  OpacityAnimationScreen({Key? key}) : super(key: key);

  @override
  _OpacityAnimationScreenState createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen> {
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
          children: [],
        ),
      ),
    );
  }
}
