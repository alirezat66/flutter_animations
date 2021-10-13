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
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'container');
                  },
                  child: Text('Animated Container And Size')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'opacity');
                  },
                  child: Text('Animated Opacity')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'crossfade');
                  },
                  child: Text('Animated CrossFade')),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'alignment');
                  },
                  child: Text('Animated Alignment')),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'padding');
                  },
                  
                  child: Text('Animated Padding')),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'fade');
                  },
                  child: Text('Fade Image')),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'position');
                  },
                  child: Text('Animated Position')),
              ElevatedButton(
                  onPressed: () {}, child: Text('Tween Animation Builder')),
            ],
          ),
        ),
      ),
    );
  }
}
