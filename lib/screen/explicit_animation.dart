import 'package:animation_training/screen/animation_rotation_widget.dart';
import 'package:animation_training/screen/explicit_animation_position.dart';
import 'package:animation_training/screen/heart_beat.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ExplicitScreen extends StatefulWidget {
  const ExplicitScreen({Key? key}) : super(key: key);

  @override
  _ExplicitScreenState createState() => _ExplicitScreenState();
}

class _ExplicitScreenState extends State<ExplicitScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e7e7),
      appBar: AppBar(
        elevation: 0,
        title: Text('Explicit Widgets'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrow_left)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedRotationWidget(),
                  Divider(
                    thickness: 4,
                  ),
                  ExplicitPositionAnimation(),
                  Divider(
                    thickness: 4,
                  ),
                  HeartBeat(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
