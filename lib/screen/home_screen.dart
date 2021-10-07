import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Inplicit Widgets'),
              ElevatedButton(onPressed: () {}, child: Text('Animated Container')),
              ElevatedButton(onPressed: () {}, child: Text('Animated Opacity')),
              ElevatedButton(onPressed: () {}, child: Text('Animated CrossFade')),
              ElevatedButton(onPressed: () {}, child: Text('Tween Animation Builder')),
            ],
          ),
        ),
      ),
    );
  }
}
