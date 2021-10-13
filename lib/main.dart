import 'package:animation_training/screen/animation_alignment_screen.dart';
import 'package:animation_training/screen/animation_container_widget.dart';
import 'package:animation_training/screen/animation_cross_fade_screen.dart';
import 'package:animation_training/screen/animation_fade_screen.dart';
import 'package:animation_training/screen/animation_opacity_screen.dart';
import 'package:animation_training/screen/animation_padding_screen.dart';
import 'package:animation_training/screen/animation_position_screen.dart';
import 'package:animation_training/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'container': (context) => AnimationContainerWidget(),
        'opacity': (context) => OpacityAnimationScreen(),
        'crossfade': (context) => CrossFadeAnimationScreen(),
        'alignment': (context) => AlignmentAnimationScreen(),
        'padding': (context) => PaddingAnimationScreen(),
        'fade': (context) => FadeAnimationScreen(),
        'position': (context) => PositionAnimationScreen(),
      },
    );
  }
}
