import 'package:animation_training/screen/animation_fade_screen.dart';
import 'package:animation_training/screen/explicit_animation.dart';
import 'package:animation_training/screen/home_screen.dart';
import 'package:animation_training/screen/implicit_screen.dart';
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
        'implicit': (context) => ImplicitScreen(),
        'fade': (context) => FadeAnimationScreen(),
        'explicit': (context) => ExplicitScreen(),
      },
    );
  }
}
